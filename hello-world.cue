// from https://github.com/dagger/dagger; tag = v0.2.4
// https://github.com/dagger/dagger/blob/main/pkg/universe.dagger.io/examples/helloworld/helloworld.cue
package helloworld

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"
)

dagger.#Plan & {
	actions: {
		_alpine: core.#Pull & {source: "alpine:3"}
		// Hello world
		hello: core.#Exec & {
			input: _alpine.output
			args: ["echo", "hello, world!"]
			always: true
		}
	}
}