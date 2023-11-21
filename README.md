# Energy conserving neural closure models 

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://tobyvg.github.io/ECNCM_1D.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://tobyvg.github.io/ECNCM_1D.jl/dev/)
[![Build Status](https://github.com/tobyvg/ECNCM_1D.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/tobyvg/ECNCM_1D.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/tobyvg/ECNCM_1D.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/tobyvg/ECNCM_1D.jl)

## Installation

To install ECNCM_1D, clone this repository:
```
git clone git@github.com:DEEPDIP-project/ECNCM_1D.git
```
then inside that folder open a Julia terminal and type
```
] activate .
] instantiate
```


## Abstract 

In turbulence modelling, and more particularly in the Large-Eddy Simulation (LES) framework, we are concerned with finding closure models that represent the effect of the unresolved subgrid-scales on the resolved scales. Recent approaches gravitate towards machine learning techniques to construct such models. However, the stability of machine-learned closure models and their abidance by physical structure (e.g. symmetries, conservation laws)  are still open problems. To tackle both issues, we take the `discretize first, filter next' approach, in which we apply a spatial averaging filter to existing energy-conserving (fine-grid) discretizations. The main novelty is that we extend the system of equations describing the filtered solution with a set of equations that describe the evolution of (a compressed version of) the energy of the subgrid-scales. Having an estimate of the energy of the subgrid-scales, we can use the concept of energy conservation and derive stability of the discrete representation. The compressed variables are determined via a data-driven technique in such a way that the energy of the subgrid-scales is matched. For the extended system, the closure model should be energy-conserving, and a new skew-symmetric convolutional neural network architecture is proposed that has this property. Stability is thus guaranteed, independent of the actual weights and biases of the network. Importantly, our framework allows energy exchange between resolved scales and compressed subgrid scales and thus enables backscatter. To model dissipative systems (e.g. viscous flows), the framework is extended with a diffusive component. The introduced neural network architecture is constructed such that it also satisfies momentum conservation. We apply the new methodology to both the viscous Burgers' equation and the Korteweg-De Vries equation in 1-D and show superior stability properties when compared to a vanilla convolutional neural network.
