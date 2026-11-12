package graph

import "github.com/peera168/gqlgen-test/graph/model"

type Resolver struct {
	users []*model.User // เก็บ user ไว้ใน memory
}
