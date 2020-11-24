CC = clang
CFLAGS = -Ofast -march=native -Wall -std=c99

image:
	$(CC) -c ext/stb_image_impl.c -o ext/stb_image.o -I. $(CFLAGS)
	$(CC) -c ext/stb_image_write_impl.c -o ext/stb_image_write.o -I. $(CFLAGS)
	$(CC) -c ext/stb_image_resize_impl.c -o ext/stb_image_resize.o -I. $(CFLAGS)
