import { withPluginApi } from 'discourse/lib/plugin-api'
import TopicRoute from 'discourse/routes/topic'

function initializePlugin(api) {

  const siteSettings = api.container.lookup('site-settings:main')

  api.decorateWidget('post-contents:after-cooked', helper => {
    let postId = helper.getModel().id
  })

  api.addPostMenuButton('tokenize', attrs => {
    return {
      action: 'clickTokenize',
      icon: 'hand-holding-usd',
      title: 'tokenize.title',
      position: 'first'
    }
  })

  api.attachWidgetAction('post-menu', 'clickTokenize', function() {

  })
}

export default {
  name: 'tokenize-button',
  initialize: function() {
    withPluginApi('0.8.6', api => initializePlugin(api))
  }
}
