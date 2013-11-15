#importall  algebraic
importall algebraic

function testBinopa()
	a1=Binopa(1)
	println("a1=",a1)

	a2=Binopa(2)
	println("a2=",a2)

	a3=a1+a2
	println("a1+a2=",a3)

	b1=Binopm(10)
	println("b1=",b1)

	b2=Binopm(20)
	println("b2=",b2)

	b3=b1*b2
	println("b1*b2=",b3)

	d1=a1+b1
	println("a1+b1=",d1)
end



function testSemigroup()

	println("Semigroup tests")

	s1=Semigroupa(11)
	println("s1=",s1)

	s2=Semigroupa(12)
	println("s2=",s2)

	s3=s1+s2
	println("s1+s2=",s3)

	s3=s1*s2
	println("s1*s2=",s3)

	t1=Semigroupm(21)
	println("t1=",t1)

	t2=Semigroupm(22)
	println("t2=",t2)

	t3=t1+t2
	println("t1+t2=",t3)


	t3=t1*t2
	println("t1*t2=",t3)

end


function testMonoid()

	println("Monoid tests")

	s1=Monoida(0,11)
	println("s1=",s1)

	s2=Monoida(0,12)
	println("s2=",s2)

	s3=s1+s2
	println("s1+s2=",s3)

	s3=s1*s2
	println("s1*s2=",s3)

	t1=Monoidm(1,21)
	println("t1=",t1)

	t2=Monoidm(1,22)
	println("t2=",t2)

	t3=t1+t2
	println("t1+t2=",t3)

	println("t2.id=",getId(t2))

	t3=t1*t2
	println("t1*t2=",t3)

	println("t3.id=",getId(t3))

end

function testGroup()

	println("group tests")

	s1=Groupa(0,11)
	println("s1=",s1)

	s2=Groupa(0,12)
	println("s2=",s2)

	s3=s1+s2
	println("s1+s2=",s3)

	s3=s1*s2
	println("s1*s2=",s3)

	t1=Groupm(1,21)
	println("t1=",t1)

	t2=Groupm(1,22)
	println("t2=",t2)

	t3=t1+t2
	println("t1+t2=",t3)

	println("t3.id=",getId(t3))

	t3=t1*t2
	println("t1*t2=",t3)

	println("t3.id=",getId(t3))

	t3=t1-t2
	println("t1-t2=",t3)

	#TODO : addconversion rules
	#doesn't work since try to do int division
	# t3=t1/t2
	# println("t1/t2=",t3)

	println("t3.id=",getId(t3))

end

function testField()

	println("Field tests")


	s1=Field(0,1,11)
	println("s1=",s1)

	s2=Field(0,1,12)
	println("s2=",s2)

	s3=s1+s2
	println("s1+s2=",s3)

	s3=s1*s2
	println("s1*s2=",s3)


	s3=s1-s2
	println("s1-s2=",s3)

	#TODO : addconversion rules
	#doesn't work since try to do int division
	# s3=s1/s2
	# println("s1/s2=",s3)

	println("s3.zero=$(getZero(s3))",)

	t1=Field(0,1,100)
	t2=t1*(s1+s2)
	println("t1*(s1+s2)=",t2)
	println("t2.zero=$(getZero(t2))")

	t2=(s1+s2)*t1
	println("(s1+s2)*t1=",t2)
	println("t2.zero=$(getZero(t2))")

	println("mixed Field monoid testing")

	# m1=Monoidm(1,200)
	# println("t1=$(t1) m1=$(m1)")
	# t2=t1+m1
	# println("t1+m1=",t2)

	println("Field tests Paramterized")


	s1=Field(0.0,1.0,11.0)
	println("s1=",s1)

	s2=Field(0.0,1.0,12.0)
	println("s2=",s2)

	s3=s1+s2
	println("s1+s2=",s3)

	s3=s1*s2
	println("s1*s2=",s3)


	s3=s1-s2
	println("s1-s2=",s3)


	s3=s1/s2
	println("s1/s2=",s3)

	println("s3.zero=$(getZero(s3))",)

	t1=Field(0.0,1.0,100.0)
	t2=t1*(s1+s2)
	println("t1*(s1+s2)=",t2)
	println("t2.zero=$(getZero(t2))")

	t2=(s1+s2)*t1
	println("(s1+s2)*t1=",t2)
	println("t2.zero=$(getZero(t2))")

end

function testMap()

	println("test map")

	A=[Semigroupa(k) for k in 1:10]
	println("A:\n$(A)")

	R=map(x -> x+x, A)
	println("R:\n$(R)")
	
	R=map(x -> 2*x, A)
	println("R:\n$(R)")
	
	R=map(x ->x^2 + 2*x , A)
	println("x ->x -> x^2 + 2x  for x in A:\n$(R)")
	

end


#main
# testBinopa()
# testSemigroup()
# testMonoid()
# testGroup()
# testField()
testMap()







