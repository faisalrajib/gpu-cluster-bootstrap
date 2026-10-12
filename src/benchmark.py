@'
import torch
import time

print(f"Is CUDA available? {torch.cuda.is_available()}")
if torch.cuda.is_available():
    print(f"GPU Device Name: {torch.cuda.get_device_name(0)}")
    x = torch.randn(10000, 10000, device="cuda")
    start = time.time()
    y = torch.matmul(x, x)
    torch.cuda.synchronize()
    print(f"Matrix multiplication took: {time.time() - start:.4f} seconds")
else:
    print("CUDA environment error: No Nvidia GPU detected inside container workflow.")
'@ | Out-File -FilePath src/benchmark.py -Encoding utf8