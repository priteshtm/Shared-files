table "milestones" {
  schema = schema.market
  column "milestone_id" {
    null           = false
    type           = int
    auto_increment = true
  }
  column "project_id" {
    null = false
    type = int
  }
  column "milestone" {
    null = false
    type = varchar(255)
  }
  column "start_date" {
    null = false
    type = date
  }
  column "end_date" {
    null = false
    type = date
  }
  column "completed" {
    null    = true
    type    = bool
    default = 0
  }
  primary_key {
    columns = [column.milestone_id, column.project_id]
  }
  foreign_key "milestones_ibfk_1" {
    columns     = [column.project_id]
    ref_columns = [table.projects.column.project_id]
    on_update   = RESTRICT
    on_delete   = RESTRICT
  }
  index "project_id" {
    columns = [column.project_id]
  }
}
table "projects" {
  schema = schema.market
  column "project_id" {
    null           = false
    type           = int
    auto_increment = true
  }
  column "project_name" {
    null = false
    type = varchar(255)
  }
  column "begin_date" {
    null = true
    type = date
  }
  column "end_date" {
    null = true
    type = date
  }
  column "cost" {
    null     = false
    type     = decimal(15,2)
    unsigned = false
  }
  column "created_at" {
    null    = false
    type    = timestamp
    default = sql("(current_timestamp())")
  }
  primary_key {
    columns = [column.project_id]
  }
}
schema "market" {
  charset = "utf8mb4"
  collate = "utf8mb4_general_ci"
}
