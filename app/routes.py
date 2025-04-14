from flask import Blueprint, jsonify
from .models import Task
from . import db

main = Blueprint('main', __name__)

@main.route('/')
def index():
    tasks = Task.query.all()
    return jsonify([{'id': t.id, 'title': t.title} for t in tasks])
