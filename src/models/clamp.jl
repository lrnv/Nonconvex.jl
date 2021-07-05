function clamp!(x::AbstractArray, lo::AbstractArray, hi::AbstractArray)
    @inbounds for i in eachindex(x)
        x[i] = clamp(x[i], lo[i], hi[i])
    end
    x
end
