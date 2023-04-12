/* Build with clang --target=wasm32-unknown-wasi -O0 -o simple.wasm simple.c */

int add(int a, int b)
{
	return a + b;
}

int main()
{
	return add(1,2);
}

