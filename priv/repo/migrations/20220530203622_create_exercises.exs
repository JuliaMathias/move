defmodule Move.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add(:name, :string, null: false)
      add(:description, :text)
      add(:reps, :integer, null: false)
      add(:sets, :integer, null: false)
      add(:duration_in_seconds, :integer)
      add(:weekly_frequency, :integer)
      add(:location, :string, null: false)
      add(:body_part, :string, null: false)
      add(:equipment, :string, null: false)
      add(:history, :map)

      timestamps()
    end

    create(unique_index(:exercises, :name))
  end
end
