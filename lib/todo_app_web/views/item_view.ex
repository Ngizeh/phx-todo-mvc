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
    Enum.filter(items, fn(item) -> item.status == 0 end)|> Enum.count()
  end

  def pluralize(items) do
    case(remaining_items(items) == 0 || remaining_items(items) > 1) do
      true -> "items"
      false -> "item"
    end
  end
end
