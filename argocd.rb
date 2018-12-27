# This is an auto-generated file. DO NOT EDIT
class Argocd < Formula
    desc "GitOps Continuous Delivery for Kubernetes"
    homepage "https://argoproj.io"
    url "https://github.com/argoproj/argo-cd/releases/download/v0.11.0-rc1/argocd-darwin-amd64"
    sha256 "9eb9a00a694f6e639ef07bb9465645b095246eac72701c6f5baf98ce62b77e30"
    version "0.11.0-rc1"
    bottle :unneeded
    def install
        bin.install "argocd-darwin-amd64"
        mv bin/"argocd-darwin-amd64", bin/"argocd"
    end
end
