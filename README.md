# Decoupled Appearance for 3D Gaussian Splatting
This repository aims to reproduce the decoupled appearance modules from multiple papers including

* [HierarchyGS](https://repo-sam.inria.fr/fungraph/hierarchical-3d-gaussians/) (SIGGRAPH 2024)
* [VastGaussian](https://arxiv.org/pdf/2402.17427) (CVPR 2024)
* [Bilateral Guided Radiance Field Processing](https://bilarfpro.github.io/) (SIGGRAPH 2024 Honarable Mention)
* [DAVIGS](https://arxiv.org/pdf/2501.10788) (AAAI 2025)
## Motivation
To train a high quality radiance field without floaters, we often need to carefully capture the scene by fixing the exposure, white balance and other camera parameters to ensure the assumption of multiview consistency. However, for in-the-wild captures, it is hard to maintain the multiview consistency assumption because of varying lightning which results in many floaters in the radiance field.

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

## Ideas
From the [DAVIGS](https://arxiv.org/pdf/2501.10788) paper, the 3D consistent feature field is queried by the rendered depth (alpha blended depth) from 3DGS. 

However, many papers and in my extensive experiments, the rendered depth map contains many holes which is not accurate enough. 

To enable a stable training of querying 3D consistent feature field, we can adopt the same idea from [StereoGS](https://kuis-ai.github.io/StereoGS/) to get a more accurate depth map. Also, there are more foundation model existing over the past few weeks, which includes:

* [FoundationStereo](https://nvlabs.github.io/FoundationStereo/)
* [StereoAnywhere](https://stereoanywhere.github.io/) (CVPR 2025)

## Installation
Please refer to the original repository [gaussian-splatting](https://github.com/graphdeco-inria/gaussian-splatting) for installation and real-time viewer usage