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

# # found=0
# # for g in G:
# #  pFacce=PermutedFacce(g,Facce)
# #  if pFacce == myFacce:
# #   found += 1
# #   print "found n. ", found, " : ", g
# # 


K=SimplicialComplex(myFacce)
K.set_immutable()

# T=simplicial_complexes.Torus()
# T.is_isomorphic(K)



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


CK=K.chain_complex()
HK = CK.homology(generators=True)
a=HK[1][0][1]
b=HK[1][1][1]
d1=CK.differential(1)

list_of_faces=list(K.n_faces(1))
list_of_faces.sort()

c1=chain_from_list( [ [1,(0,1)], [1,(1,2)], [1,(2,5)],[-1,(0,5)]], list_of_faces)
c2=chain_from_list( [ [1,(0,3)], [1,(3,6)], [-1,(0,6)]], list_of_faces)

cc1=CK({1:tuple(c1)})
cc2=CK({1:tuple(c2)})
