defmodule Mix.Tasks.Sugar.Gen.ViewTest do
  use ExUnit.Case, async: true

  test "run_detached/1" do
    assigns = [
      app: :test_app,
      module: "TestApp",
      path: "test/fixtures"
    ]
    Mix.Tasks.Sugar.Gen.View.run_detached(assigns ++ [name: "main"])

    assert File.exists?("test/fixtures/views/main.html.eex") === true
    File.rm_rf! "test/fixtures/views"
  end

  test "run/1 with proper name and default type" do
    args = ["main", "--path=test/fixtures"]
    Mix.Tasks.Sugar.Gen.View.run(args)

    assert File.exists?("test/fixtures/views/main.html.eex") === true
    File.rm_rf! "test/fixtures/views"
  end

  test "run/1 with proper name and eex type" do
    args = ["main", "--path=test/fixtures"]
    Mix.Tasks.Sugar.Gen.View.run(args)

    assert File.exists?("test/fixtures/views/main.html.eex") === true
    File.rm_rf! "test/fixtures/views"
  end

  test "run/1 with proper name and dtl type" do
    args = ["main", "--path=test/fixtures", "--type=dtl"]
    Mix.Tasks.Sugar.Gen.View.run(args)

    assert File.exists?("test/fixtures/views/main.html.dtl") === true
    File.rm_rf! "test/fixtures/views"
  end

  test "run/1 with proper name and haml type" do
    args = ["main", "--path=test/fixtures", "--type=haml"]
    Mix.Tasks.Sugar.Gen.View.run(args)

    assert File.exists?("test/fixtures/views/main.html.haml") === true
    File.rm_rf! "test/fixtures/views"
  end

  test "run/1 with no name" do
    args = ["--path=test/fixtures"]
    assert_raise Mix.Error, fn ->
      Mix.Tasks.Sugar.Gen.View.run(args)
    end
  end

  test "run/1 with improper name" do
    args = ["main/bad", "--path=test/fixtures"]
    assert_raise Mix.Error, fn ->
      Mix.Tasks.Sugar.Gen.View.run(args)
    end
  end
end
