import torch
import torch.utils
import torch.utils.cpp_extension

print(torch.utils.cpp_extension.CUDA_HOME )       #输出 Pytorch 运行时使用的 cuda
# 检查PyTorch版本
print(torch.__version__)

# 检查CUDA是否可用
print(torch.cuda.is_available())

# 查看可用的CUDA设备数量
print(torch.cuda.device_count())

# 获取PyTorch对应的CUDA版本
print(torch.version.cuda)