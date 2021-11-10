Original App Design Project - README Template
===

# BugSpray

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This app will provide solutions to users who may be struggling on how to solve or tackle a coding problem. There will be different programming language categories that the user can search for so it becomes efficient and easier for users to get the help that they made need at a quicker pace.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category**: Education/Productivity
- **Mobile:** This app could be mobile or it could be brought toward computers as well. This app would not have a set limitation because coding is mainly done on a computer.
- **Story:** Computer Science is a field of trial and error that can become very frustrating. To put users at ease, this app will allow other users to help explain and provide solutions to those who may need it.
- **Market:** Anyone who knows how to program can utilize this app to their programming needs.
- **Habit:** The app can be used as often as needed dependent upon how much the user is programming
- **Scope:** We would initially identify what level they are comfortable with, whether it'd be Advanced or Beginner. Through there, there would be vast options of different and current coding languages that a user may have a problem in. 
## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can log-in/sign-up and stay logged in 
* User can upload either file or screenshot of what they're working on
    * User can also input his or her code on a provided section and submit like hackerrank website
*  User can comment and view comments 
*  User can navigate through levels and programming languages
*  User Can Access Settings to Log Off

**Optional Nice-to-have Stories**

* User sees a styled Icon-Logo before getting on App
* User has a profile picture
* User can view profiles and view the other user's amount of questions/answers

### 2. Screen Archetypes

* Login
   * Maybe a button if youre a new user
* Screen to ask what level of Coding you are comfortable with
   * ...
   * ***
* Screen to upload either file/screenshot 
    * allows editing of file
* Screen that shows uploaded file/screenshot
    * section for users to comment
    * 

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Coding Problems
* Profile
* Settings

**Flow Navigation** (Screen to Screen)

* Log In Screen
   * Next: New Account (If Account is not made)
* Level of Advancement Page 
   * Next: Seeing the Main page with the tabs of ypur profile, coding problems, settings.
 * What Language are you looking for?
 * Language Newsfeed
     * Next: Can Access Profile
     * Next: Can Access Settings

## Wireframes
![](https://i.imgur.com/FBxOuJS.png)



## Schema 
[This section will be completed in Unit 9]
### Models
| Property | Type | Description |
| -------- | -------- | -------- |
| ObjectId     |  String   | Unique id for user post     |
| Author |Pointer to user| Image author|
| Image | File | Image the user post |
| Caption | String | Image/File Caption by author |
| Text | String  | User can Post Questions |
| CommentsCount| Number | Number of Comments a Post has |
| Document | File | User can Choose a File to Post |
| PostCount | Number | Number of Posted Questions |
| Answered Questions | Number | Number of questions answered by the user  |
| !?Count | Number | Number of !? on a post |
| UserLevel | Number | User level 1-3 Beginner-HardCore |
| UserProgrammingLanguages| Number | User can pick as many Languages as they want 1-10 (C++ - Java) |

### Networking
* Login Screen
    * (Read/Get) Collect user data as they log in
>      let user = PFUser()
>         user.username = usernameField.text
>         user.password = passwordField.text
> 
>         user.signUpInBackground { (success, error) in
>             if success {
>                 self.performSegue(withIdentifier: "loginSegue", sender: nil)
>             } else {
>                 print("Error onSignup \(String(describing: error?.localizedDescription))")
>             }
>         }
* Home Screen 
    * (Read/Get) Query all posts where user is author
>         let post = posts[indexPath.section]
        let comments = (post["comments"] as? [PFObject]) ?? []

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell

            let user = post["author"] as! PFUser
            cell.usernameLabel.text = user.username
            cell.captionLabel.text = (post["caption"] as! String)

            let imageFile = post["image"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!

            cell.photoView.af_setImage(withURL: url)


            return cell
        }else if indexPath.row <= comments.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell

            let comment = comments[indexPath.row - 1]
            cell.commentLabel.text = comment["text"] as? String

            let user = comment["author"] as! PFUser
            cell.nameLabel.text = user.username
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddCommentCell")!
            return cell
        }
* (Create/Post) Adding a comment
> let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
> 
> >let comment = comments[indexPath.row - 1]
> cell.commentLabel.text = comment["text"] as? String
> 
> let user = comment["author"] as! PFUser
> cell.nameLabel.text = user.username
> >return cell
* Logging Off
>      PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}

        delegate.window?.rootViewController = loginViewController
    }
* Creating Post Screen
    * (Create) User is creating a new post
>         let post = PFObject(className: "Posts")
>         post["caption"] = commentField.text
>         post["author"] = PFUser.current()!
> 
>         let imageData = imageView.image!.pngData()
>         let file = PFFileObject(name: "image.png", data: imageData!)
> 
>         post["image"] = file
> 
>         post.saveInBackground { (success, error) in
>             if success{
>                 self.dismiss(animated: true, completion: nil)
>                 print("saved")
>             }else{
>                 print(" error")
>             }
>         }
>     }
