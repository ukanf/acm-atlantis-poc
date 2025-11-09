# This Repo

This repo is to be synced with ACM.

Folders:

- base: is where the "base" or "common" manifests go.
  - This is where the bulk of our configs should go - helm charts contents and etc should be added here to be overwritten by overlays and then rendered.
- overlays: is where environment specific manifests go.
  - Use it when we need to overwrite specific values, for example: a different IP in a cluster.
- rendered: is where the rendered/final manifests go after being processed by kustomize.
  - Do not touch this folder directly - only kustomize (the workflow) should interact with it.

Rendered is where the clusters sync to. For example, the cluster named "my-cluster-1" will sync to the rendered/my-cluster-1 folder. 

There are two main ways to sync to a cluster:
1. We can sync to the head of main branch on lower environments and track a specific tag/release in production; so we can test things in nonp more easily before promoting to prod with a tag. 
2. We can also build a OCI image, push it to an artifact registry and sync the cluster to that specific image/version.
   1. Note: we must tar.gz: https://cloud.google.com/kubernetes-engine/enterprise/config-sync/docs/how-to/sync-oci-artifacts-from-artifact-registry#push-to-ar


More information here: [blog post gcp gke poc acm](https://felipeukan.ca/post/2025-10-27-gcp-gke-poc-acm/)
