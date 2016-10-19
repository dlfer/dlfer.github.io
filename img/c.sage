T = simplicial_complexes.Torus();

Facce= list(T.faces()[2])
Facce.sort()

def L(x):
 return set([ frozenset( [j,(j+1) % 7, (j+x+1) % 7 ]) for j in range(7) ] )
def U(x):
 return set([ frozenset( [j,(j+x) % 7, (j+x+1) % 7 ]) for j in range(7) ] )

myFacce=[tuple(a) for a in ( L(2) | U(2) ) ]
myFacce.sort()

G = T.automorphism_group() 
G =SymmetricGroup((0,1,2,3,4,5,6))

def PermutedFacce(g,ListOfTuples):
 result=[]
 for t in ListOfTuples:
  goft=[g(x) for x in t ]
  goft.sort()
  result = result + [tuple(goft)]
 result.sort()
 return result 

found=0
for g in G:
 pFacce=PermutedFacce(g,Facce)
 if pFacce == myFacce:
  found += 1
  print "found n. ", found, " : ", g


