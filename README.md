# This Repo

This repo is to be synced with ACM.

Folders:

- base: is where the "base" or "common" manifests go.
  - This is where the bulk of our configs should go - helm charts contents and etc should be added here to be overwritten by overlays and then rendered.
- overlays: is where environment specific manifests go.
  - Use it when we need to overwrite specific values, for example: a different IP in a cluster.
- rendered: is where the rendered/final manifests go after being processed by kustomize.
  - Do not touch this folder directly - only kustomize (the workflow) should interact with it.

Rendered is where the clusters sync to. For example, the cluster name "my-cluster-1" will sync to the rendered/my-cluster-1 folder. We can sync to the head of main branch on lower environments and track a specific tag/release in production; so we can test things in nonp more easily before promoting to prod.

The change to prod would still be manual by running a `kubectl patch` command to change the tag/release root-reconciler is targetting.
