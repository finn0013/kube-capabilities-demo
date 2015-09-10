# Kubernetes
This is a demonstration of the kubernetes capabilities. It is intended to explore and provide examples for different parts of the kubernetes/docker ecosystems and how things fit together, along with variations. The goal is to provide basic visualization along with  these concepts in order to make it easer to grasp for newcomers.

This project will likely evolve into a staging place for experimenting with new concepts, such as expanding pods out to use things like flume, kafka, etc.

Note that this was written on a Mac using Vagrant. If you are using something else you’ll need to modify the set-kube-env.sh file in the kubernetes-helpers directory.

## Focus Areas
This project is broken up into a few different areas of focus:

* Docker - Exploring docker file options, automated build integration, repositories, etc.
* Web - Building solutions that play within kubernetes to demonstrate key concepts of docker/kubernetes in an easy to consume manner.
* Kubernetes Helpers - A simple set of file helpers to make life a little easier and to provide some reminders.
* Kubernetes - Exploring and demonstrating the various capabilities of the kubernetes project.

More information on these areas is listed below.

### Docker
Created a docker file that adds the nano text editor to the tomcat image. The purpose is to both demonstrate how images can be added to as well as to provide a mechanism for easy troubleshooting during this pilot.

### Web
Just a single empty file right now. Will be built out to do more later though.

### Kubernetes Helpers
* set-kube-env.sh - Sets some basics for the environment like the number of minions, vagrant as the provider, etc.
* kube-all.sh - Lists the status for nodes, pods, services, replication controllers, secrets, namespace, and endpoints, all through a single command.
* kube-help.sh - Lists out useful commands in, primarily to be used as a reminder.

### Kubernetes
These files demonstrate how to set up the various aspects of the kubernetes/docker infrastructure.

Key things this is creating/using:

* Secrets
* Services with exposed endpoints
  * See http://www.mcdonaldland.info/2015/08/27/kubernetes-exposing-port-outside-cluster/ if you are having trouble getting your endpoint to work.
* Replication Controllers
  * Annotations
  * Volumes
    * Git Repo
      * Copies files from gitRepo volume into web directory for serving over http.
    * Secrets
  * Container commands
  * Environment variables
  * Liveness Probe
  * Readiness Probe
  * Lifecycle events
