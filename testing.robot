*** Settings ***
Library     Selenium2Library
Library     OperatingSystem


*** Variables ***
${URL}          https://dev.pede.id/ottokomunitaswb/?phone=8435454354&fullname=Tara&partnerid=6535&deviceid=de3c8555-bd5a-40a3-b5e2-a8ed1f0c018c&email=tara.putri%40ottodigital.id&appid=OTTOAPP
${Browser}      Chrome
${DELAY}        5s


*** Keywords ***
Open Site
        Open Browser            ${URL}      ${Browser}
        Maximize Browser Window


New Status
        Sleep    ${DELAY}
        Selenium2Library.Click Element      xpath=/html/body/div/div[2]/ul/li[3]
        Sleep    ${DELAY}
        Selenium2Library.Element Should be visible      class=clickable-dismiss
        Selenium2Library.Click Element       xpath=//*[@id="app"]/div[2]/img[1]
        Sleep    ${DELAY}
        Selenium2Library.Input Text         xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[2]/textarea          Test Posting by Automate
        Selenium2Library.Click Element       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[4]/div/div
        Selenium2Library.Click Element       xpath=//*[@id="app"]/div[4]/div[2]/div/div/ul/p/li
        Selenium2Library.Click Element       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div
        Selenium2Library.Click Element       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/button/div

Post Comment
        Sleep       ${DELAY}
        Selenium2Library.Element Should be visible      class=like-label
        Selenium2Library.Click Element                  xpath=//*[@id="app"]/div[1]/div/div/div[1]/div[2]/div[2]/div[1]/div/div[5]/div/img[2]
        Sleep       ${DELAY}
        Selenium2Library.Element Should be visible      xpath=//*[@id="post-detail-popup"]/div[3]/textarea 
        Selenium2Library.Input Text         xpath=//*[@id="post-detail-popup"]/div[3]/textarea          Test Comment by Automate
        Selenium2Library.Element Should be visible      xpath=//*[@id="post-detail-popup"]/div[3]/div/button
        Selenium2Library.Click button                   xpath=//*[@id="post-detail-popup"]/div[3]/div/button


Like Status
        Sleep       ${DELAY}
        Selenium2Library.Click Element          xpath=//*[@id="post-detail-popup"]/div[1]/div/img
        Selenium2Library.Click Element          xpath=//*[@id="app"]/div[1]/div/div/div[1]/div[2]/div[2]/div[1]/div/div[5]/div/span[1]


***Test Cases ***
Posting Status Test
        Open Site
        New Status
        Post Comment
        Like Status
    
        