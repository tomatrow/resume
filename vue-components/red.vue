<template>
<div class="resume" id="template">
    <div id="resume-header">
        <div id="header-left">
            <h2 id="position">{{person.position}}</h2>
            <h1 id="name">{{person.name.first}} {{person.name.last}}</h1>
            <div id="info-flex">
                <span id="email"><a :href='"mailto:" + person.contact.email'>
                  <i class="fa fa-envelope" aria-hidden="true"></i> {{person.contact.email}}</a></span>
                <span id="phone"><a :href='"tel:" + "+" + person.contact.phone'>
                  <i class='fa fa-phone-square' aria-hidden="true"></i> {{person.contact.phone}}</a></span>
                <span v-if="person.contact.website" id="website"><a :href='"https://" + person.contact.website'><i class="fa fa-home" aria-hidden="true"></i> {{person.contact.website}}</a></span>
                <span v-if="person.contact.github" id="github"><a :href='"https://github.com/" + person.contact.github'><i class="fa fa-github" aria-hidden="true"></i> {{person.contact.github}}</a></span>
            </div>
        </div>
        <div id="header-right">
            <div id="headshot"></div>
        </div>
    </div>
    <div id="resume-body">
<!--         <div id="about-me-container">
            <div v-if="person.about">
                <h2>{{ lang.headings.about }}</h2>
                <p>{{person.about}}</p>
            </div>
        </div> -->

        <div id="apps-container">
            <h2 id="apps-title">{{ lang.headings.apps }}</h2>
            <div class="spacer"></div>
            <div class="apps" v-for="app in person.apps" :key="app.name">
                <h2 class="app-name">{{app.name}}</h2>
                <p><span class="app-language">{{app.language}} | </span><span class="app-description">{{app.description}}</span></p>
                <ul id="tech-list">
                    <li class="" v-for="technology in app.technologies" :key="technology.name">
                        {{technology.name}} | {{technology.author}}
                    </li>
                </ul>
            </div>
        </div>

        <!-- <div id="experience-container"  v-if="person.experience != []">
            <h2 id="experience-title">{{ lang.headings.experience }}</h2>
            <div class="spacer"></div>
            <div class="experience" v-for="experience in person.experience" :key="experience.company">
                <h2 class="company">{{experience.company}}</h2>
                <p class="job-info"><span class="job-title">{{experience.position}} | </span><span class="experience-timeperiod">{{experience.timeperiod}}</span></p>
                <p class="job-description" v-if="experience.description">{{experience.description}}</p>
                <ul v-if="experience.list" >
                    <li v-for="(item, index) in experience.list" :key="index">
                      <span class="list-item-black">
                        {{item}}
                      </span>
                    </li>
                </ul>
            </div>
        </div> -->

        <div id="volunteering-container" v-if="person.volunteering != []">
            <h2 id="volunteering-title">{{ lang.headings.volunteering }}</h2>
            <div class="spacer"></div>
            <div class="volunteering" v-for="volunteering in person.volunteering" :key="volunteering.role">
                <h2 class="volunteering-role">{{volunteering.role}}, {{volunteering.organization}}</h2>
                <p class="volunteering-description">{{volunteering.description}} | <span class="volunteering-timeperiod">{{volunteering.timeperiod}}</span></p>
            </div>
        </div>

        <div id="education-container">
            <h2 id="education-title">{{ lang.headings.education }}</h2>
            <div class="spacer"></div>
            <div class="education" v-for="education in person.education" :key="education.degree">
                <h2 class="education-description">{{education.description}}</h2>
                <p><span class="degree">{{education.degree}} | </span><span class="education-timeperiod">{{education.timeperiod}}</span></p>
            </div>
        </div>

        <!-- <div id="skills-container" v-if="person.skills != []">
            <h2 id="skills-title">{{ lang.headings.skills }}</h2>
            <div class="spacer"></div>
            <p id="skill-description">{{person.knowledge}}</p>
            <ul id="skill-list">
                <li class="skill" v-for="skill in person.skills" :key="skill.name">
                  <span class="list-item-black">
                    {{skill.name}}
                  </span>
                </li>
            </ul>
        </div> -->

        <!-- We *know* they are keyphrases, but we call them *notes*. -->
        <div id="notes-container" v-if="person.keyphrases != []">
            <h2 id="notes-title">{{ lang.headings.notes }}</h2>
            <div class="spacer"></div>
            <ul id="keyphrase-list">
                <li class="keyphrase" v-for="keyphrase in person.keyphrases">
                    <span class="list-item-black">
                        {{keyphrase}}
                    </span>
                </li>
            </ul>
        </div>

    </div> <!-- /body -->

    <div id="resume-footer">
    </div>

</div>
</template>

<script>
import Vue from 'vue';
import { getVueOptions } from './options';

let name = 'red';
export default Vue.component(name, getVueOptions(name));
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="less" scoped>
@text-red: #232323;
#template {
    box-sizing:border-box;
    font-family:'Open Sans', sans-serif;
    h1, h2 {
        /*font-family:'Open Sans Condensed', sans-serif;*/
        margin:0;
        color: @text-red;
    }

    p {
        margin:0;
        font-size:12px;
    }

    ul li {
        color:@text-red;
        font-size:12px;
    }

    a {
        color:#FFF;
        text-decoration:none;
    }

    .list-item-black {
        color:black;
    }

    #resume-header {
        color: white;
        height: 136px;
        background-color: red;
        box-shadow: inset 0px 0px 200px #301030;
        padding: 40px 100px 25px;

        #header-left {
            /*width: 465px;*/
            width:100%;
            float: left;
            h1 {
                font-size:56px;
                color:white;
                text-transform:uppercase;
                line-height:56px;
            }
            h2 {
                font-size:22px;
                color:white;
            }
            #info-flex {
                display:flex;
                margin-top:20px;
                font-size:14px;

                span {
                    margin-right:25px;
                }
                i {
                    margin-right:5px;
                }
            }
        }

        /*#header-right {
            width: 125px;
            float: right;
            margin: 0px;
            box-sizing: border-box;
            height: 140px;
            background-color: #FFF;
            padding: 5px;
            #headshot {
                width: 100%;
                height: 100%;
                background:url('../../resume/id.jpg');
                background-position:center;
                background-size:cover;
            }
        }*/
    }

    #resume-body {
        padding: 40px 100px;

        #apps-title, #experience-title, #education-title, #skills-title, #volunteering-title, #notes-title {
            font-size:26px;
            text-transform:uppercase;
        }



        // .app-icon {
        //     background: attr(testing);
        //     width: 125px;
        //     height: 140px;
        //     background-position:center;
        //     background-size:cover;
        // }
 
        .experience {
            margin: 10px 0 10px 50px;
            ul {
                margin: 5px 0 0 0;
            }
        }

        .company, .education-description, .app-name, .volunteering-role {
            font-size:18px;
        }

        .job-info {
            margin-bottom:5px;
        }



        .job-title, .degree, .app-language {
            font-weight:700;
            color: @text-red;
            font-size:16px;
        }

        .experience-timeperiod, .education-timeperiod, .volunteering-timeperiod, .app-description {
            font-weight:100;
            color: @text-red;
            font-size:16px;
        }

        .education, .apps, .volunteering {
            margin: 10px 0 10px 50px;
        }

        #keyphrase-list {
            column-count: 1;
            list-style-position: inside;
            ul li {
                font-size:14px;
            }
        }

        #skill-list {
            column-count: 3;
            list-style-position: inside;
            ul li {
                font-size:14px;
            }
        }

        #education-container, #skills-container, #notes-container {
            margin-top: 20px;
        }
    }
    #resume-footer {
    }

}

.spacer {
    width:100%;
    border-bottom:1px solid @text-red;
    margin:5px 0 10px;

}
</style>
