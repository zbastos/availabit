defmodule AvailabitWeb.PageControllerTest do
  use AvailabitWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Compare availability to find the best time for everyone to meet."
  end
end
