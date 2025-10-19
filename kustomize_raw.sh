#!/bin/bash

mkdir -p rendered
find overlays -mindepth 1 -maxdepth 1 -type d | while read -r overlay_dir; do
    if [ -f "$overlay_dir/kustomization.yaml" ]; then
        cluster_name=$(basename "$overlay_dir")
        out_dir="rendered/$cluster_name"
        mkdir -p "$out_dir"
        echo "Rendering $overlay_dir -> $out_dir"
        kustomize build "$overlay_dir" -o "$out_dir"
    else
        echo "Skipping $overlay_dir (no kustomization.yaml found)"
    fi
done