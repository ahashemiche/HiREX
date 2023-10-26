<p align="center">
<img src= "https://user-images.githubusercontent.com/47638604/234387407-858814fe-5716-4c64-aace-86a4107093df.png" />
</a>
<p align="center">
<a href="https://github.com/ahashemiche/HiREX/blob/main/LICENSE">
    <img src= "https://img.shields.io/github/license/ahashemiche/HiREX?style=plastic" />
</a>    

## High-Throughput Reactivity Exploration for Extended Databases of Transition Metal Catalysts

<p align="justify"> HiREX is a method introduced for the automated reactivity exploration of extended in silico databases of transition metal catalysts. The proposed workflow is designed to tackle two key challenges for bias-free mechanistic explorations on large databases of catalysts: (1) automated exploration of the chemical space around each catalyst with unique structural and chemical features and (2) automated analysis of the resulting large chemical datasets. To address these challenges we have extended the application of our previously developed ReNeGate method for bias-free reactivity exploration and implemented an automated analysis procedure to identify the classes of reactivity patterns within specific catalyst groups. Our procedure applied to an extended series of representative Mn(I) pincer complexes revealed correlations between structural and reactive features pointing to new channels for catalyst transformation under the reaction conditions. Such an automated high-throughput virtual screening of systematically generated hypothetical catalyst datasets opens new opportunities for the design of high performance catalysts as well as an accelerated method for expert bias-free high-throughput in silico reactivity exploration.  

<p align="center">
<img src="https://user-images.githubusercontent.com/47638604/234235397-47c5280c-17d6-4d9e-9717-e489f2639bce.png" />
</p>

## 💪 Getting Started

HiREX is designed to analyze databases based on high-throughput reactivity explorations of our previous [ReNeGate](https://github.com/ahashemiche/ReNeGate) code for extended databases of transition metal catalysts. Input structures used as starting point for reactivity explorations on catalysts with CNC, PNP, PNN and SNS are produced by [ChemSpaX](https://github.com/EPiCs-group/chemspax) code and stored in Inputfiles/Input Structures in this repository. For further instructions on the usage of ChemSpaX, please refer to the main article: 

* __ChemSpaX__: Exploration of chemical space by automated functionalization of molecular scaffold [Digital Discovery 2022](https://doi.org/10.1039/D1DD00017A.)

Bias-free explorations on the starting structures are submitted via the CREST-explorations script. Trajectories from local explorations are provided to ReNeGate for identification of reaction networks and building of databases. For further information, please refer to the manuals on the ReNeGaTe repository and the main article:

* __ReNeGaTe__: Reaction Network Graph Theoretical tool for automated mechanistic studies in computational homogeneous catalysis [JCTC 2022](https://doi.org/10.1021/acs.jctc.2c00404). 

HiREX code works based on databases of ReNeGaTe explorations on ChemSpaX libraries of catalyst structures. Databases are read as pandas dataframes: 

```python

import pandas as pd
df = pd.read_excel('Database.xlsx', index_col=0) 

```
Structures for explored species are stored in the output folder. 

For K-mode clustering, Kmode package will be used on the optimal number of cluster centers: 

```python
import numpy as np
from kmodes.kmodes import KModes
newdata = df[['Interaction']]
km = KModes(n_clusters=7, init='Huang', n_init=5, verbose=0)

clusters2 = km.fit_predict(newdata)

# Print the cluster centroids
print(km.cluster_centroids_)
```

### 📖 Citation
---
See the [HiREX](https://pubs.acs.org/doi/10.1021/acs.jcim.3c00660) Paper.

```
@article{doi:10.1021/acs.jcim.3c00660,
author = {Hashemi, Ali and Bougueroua, Sana and Gaigeot, Marie-Pierre and Pidko, Evgeny A.},
title = {HiREX: High-Throughput Reactivity Exploration for Extended Databases of Transition-Metal Catalysts},
journal = {Journal of Chemical Information and Modeling},
volume = {63},
number = {19},
pages = {6081-6094},
year = {2023},
doi = {10.1021/acs.jcim.3c00660}
}

```
## 👐 Contributing
---

If you find a bug with HiREX, please report it to the developer (ahashemiche@gmail.com). Comments and suggestions are also welcome.
</p>
