import sys
import numpy as np
import scipy
from scipy.optimize import fmin_cg, fmin
import random

MAX_TRIES=1

def L(x):
 return set([ frozenset( [j,(j+1) % 7, (j+x+1) % 7 ]) for j in range(7) if 1 ] )
def U(x):
 return set([ frozenset( [j,(j+x) % 7, (j+x+1) % 7 ]) for j in range(7) if 1 ] )

myFacce=[tuple(a) for a in ( L(4) | U(4) ) ]
myFacce.sort()

K=SimplicialComplex(myFacce)
# K=simplicial_complexes.Sphere(2)

# define  a potential function on the configuration space
# first: variables.

vertices=K.n_cells(0)
edges=K.n_cells(1)
faces=K.n_cells(2)

num_of_vertices=len(vertices)

vx=[var("x_%i" % i ) for i in range(num_of_vertices)]
vy=[var("y_%i" % i ) for i in range(num_of_vertices)]
vz=[var("z_%i" % i ) for i in range(num_of_vertices)]

MyInitData=[
[-1,-1,1],
[-1,1,-1],
[1,-1,-1],
[1,1,1],
[-0.25,0,0],
[0,0,-2],
[0.25,0,0]
]


def dotprod(x,y):
 return  x[0]*y[0] + x[1]*y[1] + x[2]*y[2] 

def sqnorm(x):
 return dotprod(x,x)

def crossprod(x,y):
 return [ x[1] *y[2] - x[2] * y[1], y[0]*x[2] - x[0]*y[2], x[0]*y[1]-y[0]*x[1] ] 

# now interactions: all possible (up to 4)
 
def interaction_vertex(a):
 return ( (vx[a])**2 + (vy[a])**2 + (vz[a])**2 )

def interaction_edge(a,b):
 return 1.0 / sqrt( (vx[a] - vx[b])**2 + (vy[a] - vy[b])**2 + (vz[a]-vz[b])**2 ) + 10 * ( (vx[a] - vx[b])**2 + (vy[a] - vy[b])**2 + (vz[a]-vz[b])**2 )

def interaction_face(a,b,c):
 return  (sqnorm(crossprod( [ vx[a] - vx[b], vy[a] - vy[b], vz[a] - vz[b]], [ vx[a] - vx[c], vy[a] - vy[c], vz[a] - vz[c]] )))**(-0.5)

def interaction_volume(a,b,c,d):
 M=matrix(SR, [[vx[a], vx[b], vx[c], vx[d]],
               [vy[a], vy[b], vy[c], vy[d]],
               [vz[a], vz[b], vz[c], vz[d]],
               [ 1   ,1     ,1     ,1    ]])
 return (1.0+M.determinant()**2)**(-1.0)

def inner_intersection(A,B,C,P,Q):
 # intersection, if exists, of the interiors of a 2-simplex ABC and a 1-simplex PQ
#  M=matrix(SR, [[A[0],B[0],C[0],-P[0],-Q[0]],
#               [A[1],B[1],C[1],-P[1],-Q[1]],
#               [A[2],B[2],C[2],-P[2],-Q[2]],
#               [1,1,1,0,0],
#               [0,0,0,1,1]])
 M=np.array([[A[0],B[0],C[0],-P[0],-Q[0]],
               [A[1],B[1],C[1],-P[1],-Q[1]],
               [A[2],B[2],C[2],-P[2],-Q[2]],
               [1,1,1,0,0],
               [0,0,0,1,1]])
 vc=np.array([[0],[0],[0],[1],[1]])
 if np.linalg.det( M )!= 0:
  sol= np.linalg.solve(M,vc)
 else:
  sys.stderr.write("SINGULAR MATRIX!\n")
  return True
 # print "sol:", sol
 # print np.dot(M,sol)
 # print vc
 for x in sol:
  if x[0] < 0: 
   return False
 sys.stderr.write("A,B,C,P,Q=%s, %s, %s, %s, %s\n" % (A,B,C,P,Q))
 sys.stderr.write("sol: %s\n%s\n" % (sol , M.dot(sol)  ))
 return True

def check_1_2_simplexes(K,points):
 edges=K.n_cells(1)
 faces=K.n_cells(2)
 for f in faces:
  for e in edges:
   if (not (set(e) & set(f))) :
     A,B,C=points[f[0]],points[f[1]], points[f[2]]
     D,E = points[e[0]],points[e[1]]
     ie=inner_intersection(A,B,C,D,E)
     if ie:
      sys.stderr.write("WARNING: Inner Intersection for face `%s` and edge `%s`!\n %s\n" % (f,e,ie) )
      return True
 return False 



potential = 0
# for (a,) in vertices: 
#  potential += 0*interaction_vertex(a) 

for (a,b) in edges:
 potential += 0*interaction_edge(a,b) 

for (a,b,c) in faces:
 potential += interaction_face(a,b,c) 

for (a,b,c) in faces: 
 for d in range(c+1,num_of_vertices):
  potential += 0*interaction_volume(a,b,c,d) 

def F(x): 
 db={}
 for j in range(num_of_vertices):
  db[vx[j]] = x[3*j]
  db[vy[j]] = x[3*j+1]
  db[vz[j]] = x[3*j+2]
 return float(potential(db))


def dF(x): 
 db={}
 vUp=[]
 for j in range(num_of_vertices):
  db[vx[j]] = x[3*j]
  db[vy[j]] = x[3*j+1]
  db[vz[j]] = x[3*j+2]
  vUp += [ diff(potential,vx[j]), diff(potential,vy[j]), diff(potential,vz[j]) ] 
 return np.array([float(tt(db)) for tt in vUp ]).transpose()


def points_from_x(x):
 result = []
 for j in range(num_of_vertices):
  result += [ ( x[3*j], x[3*j+1], x[3*j+2]) ]
 return result

def x_from_points(p):
 result = []
 for l in p:
  result += l
 return result


def display_off(lista):
 result ="""OFF
%i %i %i
""" % (len(vertices), len(faces), len(edges))
 for (x,y,z) in lista:
  result += "%s %s %s\n" % (x,y,z)
 for (a,b,c) in faces: 
  result += "3 %s %s %s\n" % (a,b,c)
 return result 


def prova(perm=None):
 sys.stderr.write("getting init point...")
 initpoint=np.array([random.random()*0.0001-0.00005 for x in range(3*num_of_vertices)])
 if perm:
  initpoint=initpoint + np.array(x_from_points([MyInitData[yy] for yy in perm]))
 is_bad=check_1_2_simplexes(K,points_from_x(initpoint))
 sys.stderr.write("initpoint is_bad? %s\n" % is_bad)
 if is_bad: 
  return None, is_bad
 sys.stderr.write("minimizing...")
 # tmpminimo=fmin(F,initpoint,disp=False)
 tmpminimo=initpoint
 sys.stderr.write(" ... done!\nNow checking %s...\n" % points_from_x(tmpminimo))
 is_bad=check_1_2_simplexes(K,points_from_x(tmpminimo))
 sys.stderr.write(" ... done!\n")
 return tmpminimo, is_bad


def finalize(tmpminimo):
 sys.stderr.write("\nNow CG-ing...")
 minimo=fmin_cg(F,tmpminimo,fprime=dF,disp=False)
 # minimo=tmpminimo
 sys.stderr.write(" ... done!\n")
 is_bad=check_1_2_simplexes(K,points_from_x(minimo))
 sys.stderr.write("minimo is_bad? %s\n" % is_bad)
 sys.stderr.write("gradient norm =%s\n" % sqrt(sum( [x**2 for x in  dF(minimo) ] )) )

 nomefile = "tmpfile.off" 
 sys.stderr.write("creating file `%s`..." % nomefile)
 fd=file(nomefile ,"w")
 fd.write(display_off(points_from_x(minimo)))
 fd.close()
 sys.stderr.write(" ...done!\n")
 
for t in range(MAX_TRIES):
 sys.stderr.write("\nTRY n. %i/%i:\n" % (t+1,MAX_TRIES))
# for p in Permutations(range(7)):
 # sys.stderr.write("\nTRY perm=%s\n" % p)
 tmpminimo, is_bad = prova(perm=range(7))
 # tmpminimo, is_bad = prova(perm=p )
 if not is_bad:
  sys.stderr.write("GOOD! Apparently it is not a bad complex... finalizing...\n")
  finalize(tmpminimo)
  break
 else:
  # finalize(tmpminimo)
  sys.stderr.write("BAD! Re-trying...\n")
