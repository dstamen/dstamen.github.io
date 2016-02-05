---
layout: post
title: "How To Deploy a Jekyll Blog"
categories:
- Jekyll
comments: true
---
So after getting my blog up and running I figured I would do a quick how-to, on how to get a blog up and running. Its actually something you can do in less than 15 minutes.

{% highlight bash %}
~ $ gem install jekyll
~ $ jekyll new myblog
~ $ cd myblog
~/myblog $ jekyll serve
# => Now browse to http://localhost:4000 and you will see the blog running!
{% endhighlight %}

Easy Enough? Now how do you create a blog post?

Create a file with the following name in the \_posts directory.
{% highlight ruby%}
# Create a file with the following syntax
YEAR-MONTH-DAY-title.md
# Example: 2015-09-08-hi-to-my-new-blog.md
{% endhighlight %}

Edit the above file and add this content. The format is done in markdown which is a very easy to write code. You can find some quick information [here](https://help.github.com/articles/markdown-basics/)
{% highlight ruby %}
---
layout: post
title: "How To Deploy a Jekyll Blog"
categories:
- Category
---
Type your blogpost here.
{% endhighlight %}

Once you save your file, you can refresh your browser pointing to http://127.0.0.1:4000 and see your change. Once you are happy with your content you have two ways to publish this to the internet.

Your own host.

Run the following command and then upload the content in the \_site directory.
{% highlight ruby%}
jekyll build
{% endhighlight %}

GitHub Pages
You can also load the site into GitHub pages and have a fully functioning site at username.github.io
You can use the following link for details.
[Host Jekyll Site using GitHub Pages](http://jekyllrb.com/docs/github-pages/)

Once you get it all up and running you can look at other [themes](http://jekyllthemes.org/) that you can clone from github and port over your posts and content.

Be on the lookout for a future blogpost on how to get an Ubuntu Server running NGINX to host your Jekyll Blog.
