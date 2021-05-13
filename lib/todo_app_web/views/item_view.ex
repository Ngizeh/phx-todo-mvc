defmodule TodoAppWeb.ItemView do
  use TodoAppWeb, :view

  def complete(item) do
    case(item.status) do
      1 -> "completed"
      _ -> ""
    end
  end

  def checked(item) do
    case(item.status) do
      1 -> "checked"
      _ -> ""
    end
  end

  def remaining_items(items) do
    Enum.filter(items, fn item -> item.status == 0 end) |> Enum.count()
  end

  def filter(items, str) do
    case(str) do
      "all" -> items
      "active" -> Enum.filter(items, fn item -> item.status == 0 end)
      "completed" -> Enum.filter(items, fn item -> item.status == 1 end)
    end
  end

  def selected(filter, str) do
    case(filter == str) do
      true -> "selected"
      false -> ""
    end
  end

  def count(items, str) do
    Enum.count(filter(items, str))
  end

  def pluralize(items) do
    case(remaining_items(items) == 0 || remaining_items(items) > 1) do
      true -> "items"
      false -> "item"
    end
  end
end
