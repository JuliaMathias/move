defmodule Move.LibraryTest do
  use Move.DataCase

  alias Move.Library

  describe "exercises" do
    alias Move.Library.Exercise

    import Move.LibraryFixtures

    @invalid_attrs %{
      body_part: nil,
      description: nil,
      duration_in_seconds: nil,
      equipment: nil,
      history: nil,
      location: nil,
      name: nil,
      reps: nil,
      sets: nil,
      weekly_frequency: nil
    }

    test "list_exercises/0 returns all exercises" do
      exercise = exercise_fixture()
      assert Library.list_exercises() == [exercise]
    end

    test "get_exercise!/1 returns the exercise with given id" do
      exercise = exercise_fixture()
      assert Library.get_exercise!(exercise.id) == exercise
    end

    test "create_exercise/1 with valid data creates a exercise" do
      valid_attrs = %{
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
      }

      assert {:ok, %Exercise{} = exercise} = Library.create_exercise(valid_attrs)
      assert exercise.body_part == :arms
      assert exercise.description == "some description"
      assert exercise.duration_in_seconds == 42
      assert exercise.equipment == :ankle_weights
      assert exercise.history == %{}
      assert exercise.location == :bedroom
      assert exercise.name == "some name"
      assert exercise.reps == 42
      assert exercise.sets == 42
      assert exercise.weekly_frequency == 42
    end

    test "can create exercise with image" do
      valid_attrs = %{
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
      }

      assert {:ok, %Exercise{}} = Library.create_exercise(valid_attrs)
    end

    test "create_exercise/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_exercise(@invalid_attrs)
    end

    test "update_exercise/2 with valid data updates the exercise" do
      exercise = exercise_fixture()

      update_attrs = %{
        body_part: :back,
        description: "some updated description",
        duration_in_seconds: 43,
        equipment: :dumbbells,
        history: %{},
        location: :irrelevant,
        name: "some updated name",
        reps: 43,
        sets: 43,
        weekly_frequency: 43
      }

      assert {:ok, %Exercise{} = exercise} = Library.update_exercise(exercise, update_attrs)
      assert exercise.body_part == :back
      assert exercise.description == "some updated description"
      assert exercise.duration_in_seconds == 43
      assert exercise.equipment == :dumbbells
      assert exercise.history == %{}
      assert exercise.location == :irrelevant
      assert exercise.name == "some updated name"
      assert exercise.reps == 43
      assert exercise.sets == 43
      assert exercise.weekly_frequency == 43
    end

    test "update_exercise/2 with invalid data returns error changeset" do
      exercise = exercise_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_exercise(exercise, @invalid_attrs)
      assert exercise == Library.get_exercise!(exercise.id)
    end

    test "delete_exercise/1 deletes the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{}} = Library.delete_exercise(exercise)
      assert_raise Ecto.NoResultsError, fn -> Library.get_exercise!(exercise.id) end
    end

    test "change_exercise/1 returns a exercise changeset" do
      exercise = exercise_fixture()
      assert %Ecto.Changeset{} = Library.change_exercise(exercise)
    end
  end
end
