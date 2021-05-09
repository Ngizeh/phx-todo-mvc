defmodule TodoAppWeb.ItemViewTest do
	use TodoAppWeb.ConnCase, async: true
	alias TodoAppWeb.ItemView

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
		items = [
			%{text: "one", status: 0},
			%{text: "two", status: 0},
			%{text: "three", status: 0},
			%{text: "four", status: 1},
		]
		assert ItemView.remaining_items(items) == 3
	end

	test "remaining_items/1 returns 0 (zero) if items count is empty" do
		items = []
		assert ItemView.remaining_items(items) == 0
	end
end

