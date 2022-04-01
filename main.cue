package secondapp

import (
  "dagger.io/dagger"
  "universe.dagger.io/docker"
)

dagger.#Plan & {
  client: {
    env: {
      DH_CREDS: dagger.#Secret
    }
  }
  actions: {
    build: docker.#Build & {
      steps: [
        docker.#Pull & {
          source: "python:3.9"
        },
      ]      
    }
    push: docker.#Push & {
      image: build.output
      dest: "darinpope/jenkins-example-dagger:1.0.0"
    }
  }
}
