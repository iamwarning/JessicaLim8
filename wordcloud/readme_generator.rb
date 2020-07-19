class ReadmeGenerator
  WORD_CLOUD_URL = 'https://raw.githubusercontent.com/JessicaLim8/JessicaLim8/master/wordcloud/wordcloud.png'

  def initialize(octokit:)
    @octokit = octokit
  end

  def generate
    contributors = Hash.new(0)
    total_words_added = 0
    total_clouds = 1 # Hardcoded value

    octokit.issues.each do |issue|
      contributors[issue.user.login] += 1
      total_words_added += 1
    end

    current_words_added = total_words_added
    current_contributors = contributors.size

    markdown = <<~HTML
      # Hi I'm Jessica 👋
      [![Linkedin Badge](https://img.shields.io/badge/-jlim-blue?style=flat&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/jlim/)](https://www.linkedin.com/in/jlim/)
      [![Medium Badge](https://img.shields.io/badge/-@__jessicalim-000000?style=flat&labelColor=000000&logo=Medium&link=https://medium.com/@_jessicalim)](https://medium.com/@_jessicalim)
      [![Website Badge](https://img.shields.io/badge/-jessicalim.me-47CCCC?style=flat&logo=Google-Chrome&logoColor=white&link=https://jessicalim.me)](https://jessicalim.me)
      [![Twitter Badge](https://img.shields.io/badge/-@__jesslim-1ca0f1?style=flat&labelColor=1ca0f1&logo=twitter&logoColor=white&link=https://twitter.com/_jesslim)](https://twitter.com/_jesslim)
      [![Instagram Badge](https://img.shields.io/badge/-@jlim__slam-purple?style=flat&logo=instagram&logoColor=white&link=https://instagram.com/jlim_slam/)](https://instagram.com/jlim_slam)
      [![Gmail Badge](https://img.shields.io/badge/-jessicalim813-c14438?style=flat&logo=Gmail&logoColor=white&link=mailto:jessicalim813@gmail.com)](mailto:jessicalim813@gmail.com)

      Welcome to my profile! I'm a student, aspiring writer, part-time coder and full-time adventure seeker. Thanks for checking out my repo, and I'd love to [connect](https://www.linkedin.com/in/jlim/)!


      ## Join my community word cloud 🔡 💭

      ![](https://img.shields.io/badge/Words%20Added-#{total_words_added}-brightgreen?labelColor=7D898B)
      ![](https://img.shields.io/badge/Word%20Clouds%20Created-#{total_clouds}-blue?labelColor=7D898B)
      ![](https://img.shields.io/badge/Total%20Contributors-#{contributors.size}-orange?labelColor=7D898B)

      **Add your own personal twist to my *Community Word Cloud* [here](https://github.com/JessicaLim8/JessicaLim8/issues/new?title=wordcloud%7C%3Cinsert-word%3E&body=Just+replace+%3Cinsert-word%3E+with+your+word!%0D%0ANext+click+%27Submit+new+issue%27).**

      The *Word Cloud* will automatically update when you add your own word 😊 The prompt will change frequently, so be sure to come back and check it out!

      <div align="center">
        <h2>Favourite Quarantine Passtime?</h2>

        &nbsp;

        <img src="#{WORD_CLOUD_URL}" alt="WordCloud" width="100%">

        &nbsp;

        ![Monthly Words Badge](https://img.shields.io/badge/Words%20in%20this%20Cloud-#{current_words_added}-darkblue?labelColor=7D898B)
        ![Monthly Contributors Badge](https://img.shields.io/badge/Contributors%20this%20Cloud-#{current_contributors}-orange?labelColor=7D898B)

      </div>
    HTML

    # TODO: [![Github Badge](https://img.shields.io/badge/-@username-24292e?style=flat&logo=Github&logoColor=white&link=https://github.com/username)](https://github.com/username)

    markdown
  end

  private

  attr_reader :octokit
end