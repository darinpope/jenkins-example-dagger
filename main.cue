package secondapp

import (
  "dagger.io/dagger"
  "universe.dagger.io/docker"
)

dagger.#Plan & {
  client: {
    env: {
      DH_CREDS_USR: string
      DH_CREDS_PSW: dagger.#Secret
    }
  }
  actions: {
    build: docker.#Build & {
      steps: [
        docker.#Pull & {
          source: "alpine:3.15.3"
        },
      ]      
    }
    push: docker.#Push & {
      auth: {
        username: client.env.DH_CREDS_USR
        secret: client.env.DH_CREDS_PSW
      }
      image: build.output
      dest: "darinpope/jenkins-example-dagger:1.0.0"
    }
  }
}
