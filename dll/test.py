from ctypes import CDLL
import time

lib = CDLL("dll.so")
start = time.monotonic()
lib.hello()
a = 2
b = 5
print(f"{a}, {b}, max: {lib.max(a, b)}")
lib.load()
end = time.monotonic()
print(f"{end - start}")
