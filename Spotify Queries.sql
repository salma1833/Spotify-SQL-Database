-- Which 5 audiobooks have the most demand? Show ABID, Book Title, and total sales as a quantity and total sale amount. 

USE g42_project_spotify; 

SELECT DISTINCT a.ABID, b.BookTitle, SUM(p.Quantity) AS TotalSalesQuantity, SUM(p.Quantity * b.BookPrice) AS TotalSalesAmount 

FROM audiobook AS a 

INNER JOIN book AS b ON a.BookID = b.BookID 

INNER JOIN ( 

  SELECT ABID, COUNT(*) AS Quantity 

  FROM ispurchasedby 

  GROUP BY ABID 

  ORDER BY Quantity DESC 

  LIMIT 5) AS p ON a.ABID = p.ABID 

GROUP BY a.ABID, b.BookTitle 

ORDER BY TotalSalesQuantity DESC, a.ABID; 


-- Spotify is looking to target email ads for a new movie adaptation of Pride and Prejudice starring Timothee Chalamet to users that have purchased this audiobook on their platform. Show UserID, UserFName, UserLName, and UserEmail. 

SELECT u.UserID, u.UserFName, u.UserLName, u.UserEmail 

FROM user AS u 

INNER JOIN ispurchasedby AS p 

ON u.UserID = p.UserID 

INNER JOIN audiobook AS a 

ON p.ABID = a.ABID 

INNER JOIN book as b 

ON a.BookID = b.BookID 

WHERE b.BookTitle = 'Pride and Prejudice'; 

-- Which users have purchased the most expensive tier level? Show TierLevel, TierPrice, UserID, and the number of audiobooks they have purchased AS NumberofAudioBooksPurchased.
-- Offer discounts in the future --> if users in this tier read 10 books in a month, then the next month, they get $5 off of their plan 
-- Or to understand how much the users of the most expensive tier level purchase/read? Does purchasing a more expensive tier mean that users will read/purchase more books? 

SELECT u.UserName, t.TierLevel, t.TierPrice, COUNT(b.ABID) AS NumberofAudioBooksPurchased 

FROM tier AS t 

INNER JOIN account AS a 

ON t.TierID = a.TierID 

INNER JOIN user AS u 

ON a.AccountID = u.AccountID 

INNER JOIN ispurchasedby AS i 

ON u.UserID = I.UserID 

INNER JOIN audiobook AS b 

ON i.ABID = b.ABID 

WHERE t.TierLevel =  

(SELECT MAX(TierLevel)  

FROM tier) 

GROUP BY u.UserID, t.TierLevel, t.TierPrice 

ORDER BY NumberofAudioBooksPurchased DESC; 

-- Which narrators narrate more than one audiobook (assuming there could be multiple narrators that satisfy this criterion)? Show NarratorFName and NarratorLName 

SELECT n.NarratorFName, n.NarratorLName 

FROM narrator as n 

JOIN audiobook as a 

ON n.narratorID = a.narratorID  

GROUP BY a.narratorID 

HAVING COUNT(*) > 1; 

-- Which users are account owners and how many total users share their accounts? Show UserFName, UserLName, AccountID and shared accounts using Alias “NumofAccounts”. Also display results in alphabetical order by last name. 

SELECT u.UserFName, u.UserLName, a.AccountID, a.NumOfAccounts 

FROM ( SELECT a.AccountID, COUNT(u.AccountID) AS NumOfAccounts 

  FROM account AS a 

  LEFT JOIN user AS u  

  ON a.AccountID = u.AccountID 

  GROUP BY a.AccountID) AS a 

LEFT JOIN (SELECT AccountID, UserFName, UserLName 

  FROM user 

  WHERE UserAccountOwner = 1) AS u  

ON a.AccountID = u.AccountID 

ORDER BY u.UserLName, a.AccountID; 
