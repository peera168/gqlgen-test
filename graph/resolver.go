package graph

import "github.com/peera168/gqlgen-test/graph/model"

type Resolver struct {
	todos  []*model.Todo
	nextID int
}
