using Ripserer
using PyCall
using JSON
nib = pyimport("nibabel")
np = pyimport("numpy")

brain_arr = np.load("arr_to_cloud.npy")
result = ripserer(Cubical(1 .- brain_arr))
result_json = JSON.json(result)
open("result.json", "w") do f
    write(f, result_json)
end