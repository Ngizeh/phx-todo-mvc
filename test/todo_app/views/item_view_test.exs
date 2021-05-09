defmodule TodoAppWeb.ItemViewTest do
	use TodoAppWeb.ConnCase, async: true
	alias TodoAppWeb.ItemView

	@items [
		%{text: "one", status: 0},
		%{text: "two", status: 0},
		%{text: "three", status: 0},
		%{text: "four", status: 1},
	]
	@one_item [%{text: "one", status: 0}]
	@empty_item []

	test "complete/1 returns completed if item.status === 1" do
		assert ItemView.complete(%{status: 1}) == "completed"
	end

	test "complete/1 return an empty string if item.status == 0" do
		assert ItemView.complete(%{status: 0}) == ""
	end

	test "checked/1 returns checked if the item.status == 1" do
		assert ItemView.checked(%{status: 1}) == "checked"
	end

	test "checked/1 returns empty string if item.status == 0" do
		assert ItemView.checked(%{status: 0}) == ""
	end

	test "remaining_items/1 returns the count of items where item.status === 0" do
			assert ItemView.remaining_items(@items) == 3
	end


	test "remaining_items/1 returns 0 (zero) if items count is empty" do
		assert ItemView.remaining_items(@empty_item) == 0
	end

	test "pluralize/1 add an 's' on the count on items" do
		assert ItemView.pluralize(@items) == "items"
		assert ItemView.pluralize(@empty_item) == "items"
		assert ItemView.pluralize(@one_item) == "item"
	end
end

