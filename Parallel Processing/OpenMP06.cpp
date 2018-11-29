#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

 void Trap(double a, double b, int n, double global result p);

 int main(int argc, char argv[]) {
 double global result = 0.0;
 double a, b;
 int n;
 int thread count;

 thread count = strtol(argv[1], NULL, 10);
 printf("Enter a, b, and nnn");
 scanf("%lf %lf %d", &a, &b, &n);
 # pragma omp parallel num threads(thread count)
 Trap(a, b, n, &global result);

 printf("With n = %d trapezoids, our estimatenn", n);
 printf("of the integral from %f to %f = %.14enn",
 a, b, global result);
 return 0;
 g / main /

 void Trap(double a, double b, int n, double global result p) f
 double h, x, my result;
 double local a, local b;
 int i, local n;
 int my rank = omp get thread num();
 int thread count = omp get num threads();

 h = (b􀀀a)/n;
 local n = n/thread count;
 local a = a + my ranklocal nh;
 local b = local a + local nh;
 my result = (f(local a) + f(local b))/2.0;
 for (i = 1; i <= local n􀀀1; i++) f
 x = local a + ih;
 my result += f(x);
 g
 my result = my resulth;

 # pragma omp critical
 global result p += my result;
 g / Trap /
 }
