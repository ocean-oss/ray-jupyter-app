# Ray App

This app starts a managed Ray cluster with a separate head and worker engines. It then launches a Jupyter Lab instance that is automatically configured to work with the cluster through the `RAY_ADDRESS` environment variable.

To immediately start using the Ray cluster create a Jupyter notebook and run the following example code:

```python
import ray

ray.init()

@ray.remote
def f(x):
    return x * x

futures = [f.remote(i) for i in range(20)]

print(ray.get(futures))
```