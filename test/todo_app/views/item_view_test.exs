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
end

