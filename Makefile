network :	BN_layer.o cnn.o  dense_layer.o main.o pool_layer.o read_npy.o relu_layer.o softmax.o conv_layer.o 
	gcc -o network BN_layer.o cnn.o  dense_layer.o main.o pool_layer.o read_npy.o relu_layer.o softmax.o conv_layer.o -lm -std=c99

BN_layer.o : BN_layer.c BN_layer.h cnn.h 
	gcc -lm -c BN_layer.c -std=c99

cnn.o : cnn.c cnn.h relu_layer.h pool_layer.h BN_layer.h dense_layer.h softmax.h 
	gcc -c cnn.c -lm -std=c99

dense_layer.o : dense_layer.c dense_layer.h cnn.h 
	gcc -c dense_layer.c -std=c99     

main.o : main.c read_npy.h cnn.h 
	gcc -c main.c -std=c99

pool_layer.o : pool_layer.c pool_layer.h cnn.h 
	gcc -c pool_layer.c -std=c99

read_npy.o : read_npy.c read_npy.h 
	gcc -c read_npy.c -std=c99

relu_layer.o : relu_layer.c relu_layer.h cnn.h 
	gcc -c relu_layer.c -std=c99

softmax.o : softmax.c softmax.h 
	gcc -c softmax.c -lm -std=c99

conv_layer.o : conv_layer.c conv_layer.h cnn.h
	gcc -c conv_layer.c -std=c99



clean : 
	rm BN_layer.o cnn.o dense_layer.o main.o pool_layer.o read_npy.o relu_layer.o softmax.o conv_layer.o network

