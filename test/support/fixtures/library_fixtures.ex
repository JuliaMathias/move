defmodule Move.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Move.Library` context.
  """

  @doc """
  Generate a exercise.
  """
  def exercise_fixture(attrs \\ %{}) do
    {:ok, exercise} =
      attrs
      |> Enum.into(%{
        body_part: :arms,
        description: "some description",
        duration_in_seconds: 42,
        equipment: :ankle_weights,
        history: %{},
        location: :bedroom,
        name: "some name",
        reps: 42,
        sets: 42,
        weekly_frequency: 42
      })
      |> Move.Library.create_exercise()

    exercise
  end
end
