import os, sys
import pathlib
import re
import datetime


def get_file_names(folder_path):
    file_names = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_names.append(file)
    
    return file_names

def get_recent_project_list(file_names):
    recent_project_list = []
    recent_project_list = sorted(file_names, reverse=False)[:5]
    
    return recent_project_list

def get_recent_blog_list(file_names):
    recent_blog_list = []
    recent_blog_list = sorted(file_names, reverse=True)[:5]
    
    return recent_blog_list


if __name__ == '__main__':
    print("Update readme for JadeCong")
    
    # Get recent project list from target repository
    project_path = "JadeCong.github.io/_projects"
    recent_projects = get_recent_project_list(get_file_names(project_path))
    print(recent_projects)
    
    # Get recent blog list from target repository
    blog_path = "JadeCong.github.io/contents/blogs/_posts"
    recent_blogs = get_recent_blog_list(get_file_names(blog_path))
    print(recent_blogs)
