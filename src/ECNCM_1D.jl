module ECNCM_1D

include("methods.jl")
include("discretization.jl")
include("NN_things.jl")

export generate_domain_and_filters
export gen_conv_stencil
export gen_rand_condition
export simulation
export gen_train_test_set
export gen_subgrid_filter
export subgrid_filter_loss
export gen_t_stencil
export gen_T
export gen_model
export gen_trajectory_data
export loss_function
export trajectory_loss_function
export padding_wrapper
export adj_flatten
export model_wrapper
export process_HR_solution

end
