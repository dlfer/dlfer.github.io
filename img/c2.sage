def L(x):
 return set([ frozenset( [j,(j+1) % 7, (j+x+1) % 7 ]) for j in range(7) ] )
def U(x):
 return set([ frozenset( [j,(j+x) % 7, (j+x+1) % 7 ]) for j in range(7) ] )

myFacce=[tuple(a) for a in ( L(2) | U(2) ) ]
myFacce.sort()

K=SimplicialComplex(myFacce)
K.set_immutable()

def chain_from_list(l,list_of_faces):
 # l is a list of pairs: integer + simplex
 # (Simplex( tuple))
 # list_of_faces is the list of faces
 N=len(list_of_faces)
 result=([0 for x in range(N) ])
 for k,p in l:
  try:
    i = list_of_faces.index(Simplex(p))
    result[i] += k
  except Exception, v:
    print "ERROR:", v
 return vector(tuple(result))

def list_from_chain(c,list_of_faces):
 # c is a chain
 N=len(list_of_faces)
 result=[]
 for x in range(N):
  k=c[x]
  if k != 0:
   result += [ [k,list_of_faces[x]] ]
 return result

CK=K.chain_complex()
HK = CK.homology(generators=True)
aa=HK[1][0][1]
bb=HK[1][1][1]
d1=CK.differential(1)
list_of_faces=list(K.n_cells(1))

a= list_from_chain(aa.vector(1),list_of_faces)
b= list_from_chain(bb.vector(1),list_of_faces)




c1=chain_from_list( [ [1,(0,1)], [1,(1,2)], [1,(2,5)],[-1,(0,5)]], list_of_faces)
c2=chain_from_list( [ [1,(0,3)], [1,(3,6)], [-1,(0,6)]], list_of_faces)

cc1=CK({1:tuple(c1)})
cc2=CK({1:tuple(c2)})

maxR=2
for x in range(2*maxR):
 for y in range(2*maxR):
  # r=(Integer(x-maxR) * aa + Integer(y-maxR) * bb - cc1).is_boundary()
  # bb equiv cc1
  r=(Integer(x-maxR) * aa + Integer(y-maxR) * bb - cc2).is_boundary()
  # also bb equiv cc2 => cc1 and cc2 equivalent! 
  if r: print x-maxR,y-maxR, r

print (cc1-cc2).is_boundary()
print cc1
print cc2
