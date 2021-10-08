from flask import Flask, redirect, make_response, render_template, Blueprint
app = Flask(__name__, static_folder="static/assets", static_url_path="/assets")
static_images = Blueprint("images", __name__, static_folder="static/images", static_url_path="/images")
app.register_blueprint(static_images)

@app.route("/")
def redirect_index():
    return redirect("/index.html")

@app.route("/index.html")
def index():
    resp = make_response(render_template("index.html"))
    resp.headers["Flag"] = "hiuctf{0k_g0_ah3ad}"
    return resp


if __name__ == "__main__":
    print(app.url_map)
    from waitress import serve
    serve(app, host="0.0.0.0", port=80)