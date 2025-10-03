from scene.app_module.appearance_network import AppearanceNetwork
from abc import abstractmethod
from torch import nn

class AppearanceModule(nn.Module):
    def __init__(self):
        pass

    @abstractmethod
    def forward(self):
        raise NotImplementedError
    
    @abstractmethod
    def compute_loss(self):
        raise NotImplementedError
    
    