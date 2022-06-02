defmodule Move.Library.Exercise do
  @moduledoc """
  The Exercise entity.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}

  schema "exercises" do
    field :body_part, Ecto.Enum,
      values: [
        :arms,
        :back,
        :calves,
        :core,
        :feet,
        :glutes,
        :hands,
        :hips,
        :legs,
        :neck,
        :shoulders,
        :thighs,
        :wrists
      ]

    field :description, :string
    field :duration_in_seconds, :integer

    field :equipment, Ecto.Enum,
      values: [
        :ankle_weights,
        :dumbbells,
        :elastic_bands,
        :finger_elastics,
        :mini_resistance_bands,
        :none,
        :resistance_bands
      ]

    field :history, :map
    field :location, Ecto.Enum, values: [:bedroom, :irrelevant, :living_room]
    field :name, :string
    field :reps, :integer, default: 1
    field :sets, :integer, default: 1
    field :weekly_frequency, :integer

    timestamps()
  end

  @doc false
  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [
      :name,
      :description,
      :reps,
      :sets,
      :duration_in_seconds,
      :weekly_frequency,
      :location,
      :body_part,
      :equipment,
      :history
    ])
    |> validate_required([
      :name,
      :description,
      :reps,
      :sets,
      :location,
      :body_part,
      :equipment
    ])
  end
end
