## Ideas
From the [DAVIGS](https://arxiv.org/pdf/2501.10788) paper, the 3D consistent feature field is queried by the rendered depth (alpha blended depth) from 3DGS. 

However, many papers and in my extensive experiments, the rendered depth map contains many holes which is not accurate enough. 

To enable a stable training of querying 3D consistent feature field, we can adopt the same idea from [StereoGS](https://kuis-ai.github.io/StereoGS/) to get a more accurate depth map. Also, there are more foundation model existing over the past few weeks, which includes:

* [FoundationStereo](https://nvlabs.github.io/FoundationStereo/) (CVPR 2025)
* [StereoAnywhere](https://stereoanywhere.github.io/) (CVPR 2025)