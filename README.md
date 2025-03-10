# Decoupled Appearance for 3D Gaussian Splatting
This repository aims to reproduce the decoupled appearance modules from multiple papers including

* [HierarchyGS](https://repo-sam.inria.fr/fungraph/hierarchical-3d-gaussians/) (SIGGRAPH 2024)
* [VastGaussian](https://arxiv.org/pdf/2402.17427) (CVPR 2024)
* [Bilateral Guided Radiance Field Processing](https://bilarfpro.github.io/) (SIGGRAPH 2024 Honarable Mention)
* [DAVIGS](https://arxiv.org/pdf/2501.10788) (AAAI 2025)
## Motivation
* [Luminance-GS](https://github.com/cuiziteng/Luminance-GS) (CVPR 2025)
To train a high quality radiance field without floaters, we often need to carefully capture the scene by fixing the exposure, white balance and other camera parameters to ensure the assumption of multiview consistency. However, for in-the-wild captures, it is hard to maintain the multiview consistency assumption because of varying lightning. Therefore, the radiance field would appear many floaters.

Many papers handles this kind of varying lightning condition captures by introducing neural network into training 3DGS. Papers include:

* [WildGaussians](https://wild-gaussians.github.io/)
* [GS-W](https://eastbeanzhang.github.io/GS-W/)
* [SWAG](https://arxiv.org/pdf/2403.10427v1)

Although these methods are good at modeling appearance variations by using neural network, we need to inference a neural network at test time which may cause FPS drop when the scene is larger.

We seek for different approaches by **decoupling** the appearance variations and fuse into a floater-free radiance field which can be used in a normal rendering pipeline without inferencing a neural network.

## TODOs
Support multiple decoupled appearance modules
- [x] [HierarchyGS](https://repo-sam.inria.fr/fungraph/hierarchical-3d-gaussians/) : Exposure compensation
- [ ] [VastGaussian](https://arxiv.org/pdf/2402.17427) : Decoupled appearance network
- [ ] [Bilateral Guided Radiance Field Processing](https://bilarfpro.github.io/) : Bilateral Grid
- [ ] [DAVIGS](https://arxiv.org/pdf/2501.10788) : 3D consistent feature field
- [ ] [Luminance-GS](https://github.com/cuiziteng/Luminance-GS)

## Installation
### Docker
You can build docker image from scratch or pull the docker image
#### Build from scratch
```
docker build -t dags .
```
#### Pull docker image
```
docker pull sunnyhong/dags
```
#### Run container
```
docker run -it --gpus all -v your_dags_path:/app -v your_dataset_path:/app/data -v your_output_path:/app/output bash
# Run code in the container
conda activate da-gs
python train.py -s data/dataset_name -m output/dataset_name
```
Please refer to the original repository [gaussian-splatting](https://github.com/graphdeco-inria/gaussian-splatting) for real-time viewer usage