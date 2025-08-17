const folders = ['Inbox', 'Sent', 'Trash'];

let viewerPOBox
let myName = ""
let contacts = []
let editableFolders = []
let mails = []


const addressBookBtn = document.getElementById('addressBookBtn');
let checkedContacts = {};
let navigatedFromFolderList = false;
let lastActiveBtn = null;
let selectedContacts = new Set(); // Keeps track of selected contacts by their name
let isSelectMode = false;
let isSelectMode2 = false;
let selectedMailIds = [];
let isSelectModeForContacts = false; // Keep track of whether we're in "Select Mode" for contacts
let selectedContactIndexes  = []; // Keep track of selected contacts by their index
const contactsPerPage = 20; // Number of contacts per page
let contactsCurrentPage = { value: 1 };
let foldersCurrentPage = { value: 1 };
let mailsCurrentPage = { value: 1 };

let mailsync = [];
let contactsToSync = [];
let foldersToSync = [];
$(document).ready(function(){
    
    $('#mainContainer').hide();  
    window.addEventListener('message', function(event){
        let data = event.data;
        if (data.action == "show") {
            
            let existingSpan = document.getElementById('viewerPOBoxElement');
            if (!existingSpan) {
                // Create and append the new element only if it doesn't exist
                const titleContainer = document.getElementById('titleContainer');
                const viewerPOBoxElement = document.createElement('span');
                viewerPOBoxElement.id = 'viewerPOBoxElement'; // Give it an ID
                viewerPOBoxElement.textContent = `PO Box: (${viewerPOBox})`;
                titleContainer.appendChild(viewerPOBoxElement);
            } else {
                // Update the existing element
                existingSpan.textContent = `PO Box: (${viewerPOBox})`;
            }
            toggleMailEmoji(false)
            setActiveBtn()
            reOrderContacts();
            clearContentContainer();
            updateUnreadCount();
            $('#mainContainer').fadeIn(500);  // Show the body when "show" message is received
        }else if (data.action == "loaddata") {
            viewerPOBox = data.address;
            contacts = data.contacts;
            editableFolders = data.editableFolders;
            mails = data.mails;
            updateUnreadCount(true);

        } else if (data.action == "addIdtoContact") {
            for (let i = 0; i < contacts.length; i++) {
                if (contacts[i].id === null || contacts[i].id === undefined) {
                  contacts[i].id = data.addedId;
                  enableUI()
                  break;
                }
              }
        } else if (data.action == "addIdtoMail") {
            mailsCurrentPage.value = 1;  // Reset to the first page
            mails.push(data.newMail);
            if (!data.inmail) {
                updateUnreadCount(true);
            } else {
                updateUnreadCount();
            }

        } else if (data.action == "addIdtoFolder") {
            for (let i = 0; i < editableFolders.length; i++) {
                if (editableFolders[i].id === null || editableFolders[i].id === undefined) {
                    editableFolders[i].id = data.addedId;
                    enableUI()
                    break;
                }
            }
        }
    });

    // Listen for the Escape key
    $(document).keydown(function(e) {
        if (e.key === "Escape") {  // Check if Escape key is pressed
            $('#mainContainer').fadeOut(500);  // Hide the body
            $.post('http://syn_mail/closeui', JSON.stringify({}));
        }
    });
});
function disableUI() {
    document.getElementById("overlay").style.display = "block";
}

function enableUI() {
    document.getElementById("overlay").style.display = "none";
}
function toggleMailEmoji(show) {
    const mailEmojiContainer = document.getElementById("mailEmojiContainer");
    if (show) {
      mailEmojiContainer.style.display = "block";
    } else {
      mailEmojiContainer.style.display = "none";
    }
  }
function updateUnreadCount(check) {
    const unreadCount = mails.filter(mail => 
        !mail.read && 
        mail.folder === 'Inbox' && 
        (Array.isArray(mail.to) ? mail.to.includes(viewerPOBox.toString()) : mail.to === viewerPOBox) && 
        mail.from !== viewerPOBox
    ).length;

    const unreadElement = document.getElementById('unreadCount');
        
    if (unreadCount > 0) {
        let displayText = unreadCount > 99 ? '99+' : unreadCount.toString();
        unreadMailIndicator.textContent = displayText;
        unreadElement.textContent = displayText;
        unreadElement.style.display = 'inline-block';
        if (check) {
            toggleMailEmoji(true)
        }
        
    } else {
        unreadElement.style.display = 'none';
    }
}
function clearContentContainer() {
    contentContainer.innerHTML = '';
}
function reOrderContacts() {
    contacts.sort((a, b) => {
        const nameA = a.name.toUpperCase(); // ignore upper and lowercase
        const nameB = b.name.toUpperCase(); // ignore upper and lowercase

        // If both start with a number or both start with a non-number
        if (!isNaN(nameA[0]) === !isNaN(nameB[0])) {
            return nameA < nameB ? -1 : nameA > nameB ? 1 : 0;
        }

        // If 'a' starts with a number and 'b' doesn't
        return isNaN(nameA[0]) ? 1 : -1;
    });
}



function formatToLocalDateTime(isoString) {
    const localDate = new Date(isoString);

    const pad = (num) => num < 10 ? '0' + num : num;
    return localDate.getFullYear() + '-' +
           pad(localDate.getMonth() + 1) + '-' +
           pad(localDate.getDate()) + ' ' +
           pad(localDate.getHours()) + ':' +
           pad(localDate.getMinutes()) + ':' +
           pad(localDate.getSeconds());
}
function formatDateUTC() {
    return new Date().toISOString();
}
document.addEventListener('click', function(event) {
    // Check for both types of modals
    const customModal = document.querySelector('.custom-modal');
    const folderModal = document.querySelector('.folder-modal');
    const customInputBoxModal = document.querySelector('#customInputBoxModal');
    // Remove .custom-modal
    if (customModal && !customModal.contains(event.target) && event.target.id !== 'sendToLabel') {
        customModal.remove();
    }
    if (folderModal && !folderModal.contains(event.target)) {
        folderModal.remove();
    }
    if (customInputBoxModal && !customInputBoxModal.contains(event.target) && !customInputBoxModal.justOpened) {
        customInputBoxModal.remove();
    } else if (customInputBoxModal && customInputBoxModal.justOpened) {
        customInputBoxModal.justOpened = false;  // Reset the flag
    }
});

document.addEventListener('keydown', function(event) {
    // Check for both types of modals
    const customModal = document.querySelector('.custom-modal');
    const folderModal = document.querySelector('.folder-modal');

    // Remove on 'Escape' key press
    if (event.key === 'Escape') {
        if (customModal) {
            customModal.remove();
        }
        if (folderModal) {
            folderModal.remove();
        }
    }
});
function updateRecipientBubble() {
    const recipientContainer = document.getElementById('recipientName');
    recipientContainer.innerHTML = ''; // Clear the container

    if (selectedContacts.size === 0) {
        recipientContainer.textContent = 'Select recipient';
        recipientContainer.style.pointerEvents = 'none'; // Disable pointer events when no bubbles
    } else {
        recipientContainer.style.pointerEvents = 'auto'; // Enable pointer events when bubbles exist
        selectedContacts.forEach(contactOrPOBox => {
            const contact = contacts.find(c => c.name === contactOrPOBox || c.poBox === contactOrPOBox);
            let displayText, poBox;

            if (contact) {
                displayText = contact.name;
                poBox = contact.poBox;
            } else {
                displayText = contactOrPOBox; // if name not found, use the PO Box
                poBox = contactOrPOBox;
            }

            const bubble = createRecipientBubble(displayText, poBox);
            recipientContainer.appendChild(bubble);
        });
    }
}
function addSearchBar(modal) {
    const searchInput = document.createElement('input');
    searchInput.type = 'text';
    searchInput.placeholder = 'Search contacts...';
    searchInput.addEventListener('input', function () {
        const query = this.value.toLowerCase();
        const items = document.querySelectorAll('.contact-item');
        items.forEach(item => {
            const name = item.textContent.toLowerCase();
            item.style.display = name.includes(query) ? '' : 'none';
        });
    });
    modal.appendChild(searchInput);
}
function handleCheckboxChange(contactIdentifier, isChecked) {
    if (isChecked) {
        selectedContacts.add(contactIdentifier);
    } else {
        selectedContacts.delete(contactIdentifier);
    }
    checkedContacts[contactIdentifier] = isChecked;
    updateRecipientBubble();
}
function createContactItem(contact) {
    const contactItem = document.createElement('li');
    contactItem.className = 'contact-item';
    
    // Create checkbox
    const checkbox = document.createElement('input');
    checkbox.type = 'checkbox';
    const isChecked = selectedContacts.has(contact.name) || checkedContacts[contact.name];
    checkbox.checked = isChecked;
    checkbox.dataset.name = contact.name;
    checkbox.addEventListener('change', function () {
        handleCheckboxChange(contact.name, this.checked);
    });
    
    // Create name element
    const nameElement = document.createElement('span');
    nameElement.textContent = contact.name;
    
    // Attach click event to nameElement for toggling the checkbox
    nameElement.addEventListener('click', function() {
        checkbox.checked = !checkbox.checked;
        handleCheckboxChange(contact.name, checkbox.checked);
    });
    
    contactItem.appendChild(checkbox);
    contactItem.appendChild(nameElement);
    
    return contactItem;
}
function handleMouseEvents(contactItem, contact) {
    let infoDiv;
    contactItem.addEventListener('mouseover', () => {
        if (!infoDiv) {
            infoDiv = document.createElement('div');
            infoDiv.innerHTML = `<strong>Name:</strong> ${contact.name}<br><strong>PO Box:</strong> ${contact.poBox}<br><strong>Notes:</strong> ${contact.notes}`;
            infoDiv.classList.add('contact-info');
            contactItem.appendChild(infoDiv);
        }
    });

    contactItem.addEventListener('mouseout', () => {
        if (infoDiv) {
            infoDiv.remove();
            infoDiv = null;
        }
    });
}

function handleFolderItemClick(folderItem, folderName, mailIds) {
    folderItem.addEventListener('click', () => {
        const originalFolders = {};

        // Convert mailIds to numbers if they are in string format
        const numericMailIds = mailIds.map(id => Number(id));


        // Update the folder of each mail in the mails array
        numericMailIds.forEach(mailId => {
            const mailIndex = mails.findIndex(m => m.id === mailId);
            if (mailIndex !== -1) {
                originalFolders[mailId] = mails[mailIndex].folder;
                mails[mailIndex].folder = folderName;
                mails[mailIndex].action = 'update';
                mailsync.push(mails[mailIndex]);  // Add to the mailsync array for syncing actions
                syncMail();  // Call syncMail function to reflect changes
            }
        });

        // Close the modal
        const existingModal = document.querySelector('.folder-modal');
        if (existingModal) {
            existingModal.remove();
        }

        // Refresh the mail list to reflect the change in the NEW folder
        renderFolderSpecificMails(folderName);

        // Refresh the mail list to reflect the change in the ORIGINAL folders
        Object.values(originalFolders).forEach(folder => {
            renderFolderSpecificMails(folder);
        });
    });
}

function createRecipientBubble(displayText, poBox) {
    const bubble = document.createElement('span');
    bubble.className = 'recipient-bubble';
    bubble.innerHTML = displayText.includes(poBox) ? displayText : `${displayText} (${poBox})`;

    const removeBtn = document.createElement('span');
    removeBtn.className = 'remove-btn';
    removeBtn.textContent = 'X';

    removeBtn.addEventListener('click', (event) => {
        event.stopPropagation();

        // Remove the contact name and PO Box from selectedContacts Set
        selectedContacts.delete(displayText);
        selectedContacts.delete(poBox);

        // Update the checkedContacts object
        checkedContacts[displayText] = false;
        checkedContacts[poBox] = false;

        bubble.remove();

        // Find the corresponding checkbox and uncheck it
        let correspondingCheckbox = document.querySelector(`input[data-name="${displayText}"]`);
        if (!correspondingCheckbox) {
            correspondingCheckbox = document.querySelector(`input[data-po-box="${poBox}"]`);
        }

        if (correspondingCheckbox) {
            correspondingCheckbox.checked = false;
        }

        updateRecipientBubble();
    });

    bubble.appendChild(removeBtn);
    return bubble;
}

function createAnonymousToggle() {
    const anonymousToggle = document.createElement('input');
    anonymousToggle.type = 'checkbox';
    anonymousToggle.id = 'anonymousToggle';
    const anonymousLabel = document.createElement('label');
    anonymousLabel.htmlFor = 'anonymousToggle';
    anonymousLabel.textContent = 'Send Anonymously';
    return [anonymousToggle, anonymousLabel];
}
function createLetterContent() {
    const letterContent = document.createElement('div');
    letterContent.id = 'letterContent';
    letterContent.contentEditable = true;
    letterContent.placeholder = 'Write your letter here...';
    return letterContent;
}
function createSendButton() {
    const sendBtn = document.createElement('button');
    sendBtn.textContent = 'Send';
    sendBtn.className = 'address-book-btn';

    // Add click event listener to build and send the letter
    sendBtn.addEventListener('click', () => {
        buildAndSendLetter();
    });

    return sendBtn;
}
function createSendToWrapper() {
    // Create a wrapper div for the "Send To" label
    const sendToWrapper = document.createElement('div');
    sendToWrapper.id = 'sendToWrapper';
    
    // Create and configure the "Send To" label
    const sendToLabel = document.createElement('div');
    sendToLabel.id = 'sendToLabel';
    
    const recipientName = document.createElement('span');
    recipientName.id = 'recipientName';
    recipientName.textContent = 'Select recipient';
    
    sendToLabel.innerHTML = 'Send To: ';
    sendToLabel.appendChild(recipientName);

    // Append the "Send To" label to the wrapper
    sendToWrapper.appendChild(sendToLabel);

    // Function to update pointer events
    const updatePointerEvents = () => {
        if (recipientName.textContent === 'Select recipient') {
            recipientName.style.pointerEvents = 'none';
        } else {
            recipientName.style.pointerEvents = 'auto';
        }
    };

    // Initially set pointer events
    updatePointerEvents();

    // Attach the click event to the wrapper div
    sendToWrapper.addEventListener('click', function() {
        createContactDropdown(contacts);  // Assuming `contacts` is globally available
        updateRecipientBubble();  // Update recipient bubbles
        updatePointerEvents();  // Update pointer events
    });

    return sendToWrapper;
}
function createSubjectInput() {
    const subjectWrapper = document.createElement('div');
    subjectWrapper.className = 'subject-wrapper'; // CSS class for padding

    const subjectLabel = document.createElement('label');
    subjectLabel.textContent = 'Subject:';
    subjectLabel.className = 'subject-label';  // CSS class for padding

    const subjectInput = document.createElement('input');
    subjectInput.type = 'text';
    subjectInput.id = 'subjectInput';  // CSS id for width

    subjectWrapper.appendChild(subjectLabel);
    subjectWrapper.appendChild(subjectInput);

    return subjectWrapper;
}
function createContactDropdown(contacts) {
    const existingModal = document.querySelector('.custom-modal');
    if (existingModal) {
        existingModal.remove();
    }

    const modal = document.createElement('div');
    modal.className = 'custom-modal';

    addSearchBar(modal);
    
    // Add PO BOX input and send button
    const poBoxWrapper = document.createElement('div');
    poBoxWrapper.className = 'po-box-wrapper';
    const poBoxLabel = document.createElement('label');
    poBoxLabel.textContent = 'PO BOX ';
    poBoxWrapper.appendChild(poBoxLabel);
    const poBoxInput = document.createElement('input');
    poBoxInput.type = 'number';
    poBoxInput.className = 'po-box-input';
    poBoxWrapper.appendChild(poBoxInput);
    const sendButton = document.createElement('button');
    sendButton.textContent = '+';
    sendButton.className = 'address-book-btn  small-btn';
    poBoxWrapper.appendChild(sendButton);
    poBoxInput.addEventListener('keydown', (event) => {
        if (event.key === 'Enter') {
            event.preventDefault(); // Prevent default "Enter" key behavior
            sendButton.click(); // Trigger the send button click event
        }
    });
    // Add event listener to the send button
    sendButton.addEventListener('click', () => {
        const poBoxNumber = poBoxInput.value;
        if (poBoxNumber) {
            // Clear input after use
            poBoxInput.value = '';
            let correspondingContact = contacts.find(c => c.poBox === poBoxNumber);
            if (correspondingContact) {
                selectedContacts.add(correspondingContact.name);
                checkedContacts[correspondingContact.name] = true;
            } else {
                selectedContacts.add(poBoxNumber);
                checkedContacts[poBoxNumber] = true;
            }
            updateRecipientBubble();
        }
    });
    modal.insertBefore(poBoxWrapper, modal.firstChild);
    const label = document.createElement('label');
    modal.appendChild(label);

    const contactList = document.createElement('ul');
    
    contacts.forEach((contact, index) => {
        const contactItem = createContactItem(contact);
        const checkbox = contactItem.querySelector('input[type="checkbox"]');
        
        // Setting data attributes to link checkboxes with bubbles
        checkbox.dataset.name = contact.name;
        checkbox.dataset.poBox = contact.poBox;
        if (checkedContacts[contact.name] || checkedContacts[contact.poBox]) {
            checkbox.checked = true;
        }
        handleMouseEvents(contactItem, contact);
        handleClickEvents(checkbox, contact); // Passing only the checkbox and the contact

        contactList.appendChild(contactItem);
    });

    modal.appendChild(contactList);
    document.body.appendChild(modal);
}
function handleClickEvents(checkbox, contact) {
    checkbox.addEventListener('change', () => {
        if (checkbox.checked) {
            selectedContacts.add(contact.name);
        } else {
            selectedContacts.delete(contact.name);
        }
        updateRecipientBubble(); // Update the recipient bubble whenever a checkbox changes
    });
}

// Function to create the search box
function createSearchBox(container) {
    const searchInput = document.createElement('input');
    searchInput.type = 'text';
    searchInput.id = 'searchInput';
    searchInput.placeholder = '🔍 Search Mails';
    container.appendChild(searchInput);
    return searchInput;
}
// Function to create the mail list
function createMailList(container) {
    const mailsList = document.createElement('ul');
    mailsList.id = 'mailsList';
    container.appendChild(mailsList);
    return mailsList;
}
// Function to filter mails based on a query and condition

// Function to sort and render mails
function sortAndRenderMails(filteredMails, mailsList, fromFilter = null) {
    if (filteredMails.length === 0) {
        const noMailsMessage = document.createElement('div');
        noMailsMessage.className = 'no-mails-message';
        noMailsMessage.textContent = 'No mails to display';
        mailsList.appendChild(noMailsMessage);
        return;  // Exit the function early
    }
    if (fromFilter) {
        filteredMails = filteredMails.filter(mail => mail.from === fromFilter && mail.folder !== 'Trash' && mail.folder !== 'Sent');
    }
    filteredMails.sort((a, b) => new Date(b.date) - new Date(a.date));
    mailsList.innerHTML = '';
    filteredMails.forEach((mail, index) => {
        const mailItem = document.createElement('li');
        const mailContainer = document.createElement('div');
        mailContainer.className = 'mail-container';
        const subjectSpan = document.createElement('span');
        subjectSpan.className = 'mail-subject';
        subjectSpan.textContent = mail.subject;
        const dateSpan = document.createElement('span');
        dateSpan.className = 'mail-date';
        dateSpan.textContent = formatToLocalDateTime(mail.date);
        mailContainer.appendChild(subjectSpan);
        mailContainer.appendChild(dateSpan);
        mailItem.className = mail.read ? 'read-mail mail-item' : 'unread-mail mail-item';
        mailItem.appendChild(mailContainer);
        mailItem.setAttribute('data-mail-id', mail.id);
        mailItem.addEventListener('click', (event) => {
            if (isSelectMode2) {
                const checkbox = mailItem.querySelector('.mail-select-checkbox');
                if (checkbox) {
                    checkbox.click();  // Trigger checkbox click event
                    event.stopPropagation();
                }
            } else {
                if (!mail.read) {
                    mail.read = true;       // Set the mail as read
                    mail.action = 'read';   // Add an action property to the mail
                    mailsync.push(mail);    // Push the modified mail object to the mailsync array
                    syncMail();             // Call the syncMail function to perform the sync
                }
                // Find the mail object in the original 'mails' array using the id stored in the data attribute
                const originalMail = mails.find(m => m.id == mailItem.getAttribute('data-mail-id'));
                // Find the index of this mail object in the original 'mails' array
                const originalIndex = mails.indexOf(originalMail);
                viewMail(originalIndex);
            }
        });
        mailsList.appendChild(mailItem);
    });
}
function addCheckboxesToMails(folderName,isInSentFolder) {
    const mailItems = document.querySelectorAll('.mail-item');  
    mailItems.forEach(mailItem => {
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.className = 'mail-select-checkbox';
        // Assign the mail id to checkbox
        const mailId = mailItem.getAttribute('data-mail-id');
        checkbox.setAttribute('data-mail-id', mailId);
        checkbox.addEventListener('click', function(event) {
            event.stopPropagation();
            const clickedMailId = this.getAttribute('data-mail-id');
            if (this.checked) {
                // Add the mail id to the selectedMailIds array
                selectedMailIds.push(clickedMailId);
            } else {
                // Remove the mail id from the selectedMailIds array
                const index = selectedMailIds.indexOf(clickedMailId);
                if (index > -1) {
                    selectedMailIds.splice(index, 1);
                }
            }
            updateActionButtons(folderName, isInSentFolder);  // Add this lin
        });
        mailItem.insertBefore(checkbox, mailItem.firstChild);
    });
}

function removeCheckboxesFromMails() {
    const checkboxes = document.querySelectorAll('.mail-select-checkbox');
    checkboxes.forEach(checkbox => checkbox.remove());
    selectedMailIds = [];
}
function moveMailsToFolder(mailIds, targetFolder) {
    const originalFolders = {};

    // Convert mailIds to numbers if they are in string format
    const numericMailIds = mailIds.map(id => Number(id));

    numericMailIds.forEach(mailId => {
        const mailIndex = mails.findIndex(m => m.id === mailId);
        if (mailIndex !== -1) {
            originalFolders[mailId] = mails[mailIndex].folder;
            mails[mailIndex].folder = targetFolder;
            mails[mailIndex].action = 'update';
            mailsync.push(mails[mailIndex]);  // Add to the mailsync array for syncing actions
            syncMail();  // Call syncMail function to reflect changes
        }
    });

    // Refresh the mail list to reflect the changes
    renderFolderSpecificMails(targetFolder);
    Object.values(originalFolders).forEach(folder => {
        renderFolderSpecificMails(folder);
    });
}
function deleteMails(mailIds) {
    // Convert the input into an array if it's not
    
        const idsArray = Array.isArray(mailIds) ? mailIds : [mailIds];

        // Convert mailIds to numbers if they are in string format
        const numericMailIds = idsArray.map(id => Number(id));
    
        // Remove mails from the mails array
        mails = mails.filter(mail => !numericMailIds.includes(mail.id));
    
        // Refresh the mail list to reflect the changes
        renderFolders();
}
function updateActionButtons(folderName,isInSentFolder) {
    // Remove existing action buttons if they exist
    ['moveButton', 'actionButton', 'deleteButton'].forEach(id => {
        const elem = document.getElementById(id);
        if (elem) elem.remove();
    });

    // Don't proceed if no mail is selected
    if (selectedMailIds.length === 0) return;

    let moveButton = null;
    let actionButton = null;
    let deleteButton = null;

    // Logic for creating Move button
    if ((folderName === 'Inbox' &&  !isInSentFolder && editableFolders.length > 0) || editableFolders.includes(folderName) ) {
        moveButton = document.createElement('button');
        moveButton.id = 'moveButton';
        moveButton.className = 'address-book-btn';
        moveButton.textContent = 'Move';

        moveButton.addEventListener('click', () => {
            let foldersToShow;
            if (folderName === 'Inbox') {
                foldersToShow = editableFolders;
            } else {
                foldersToShow = ['Inbox', ...editableFolders.filter(f => f !== folderName)];
            }
            createFolderModal(foldersToShow, selectedMailIds);
        });
    }

    // Logic for creating Trash or Restore button
    if (folderName !== 'Trash') {
        actionButton = document.createElement('button');
        actionButton.id = 'actionButton';
        actionButton.className = 'address-book-btn-trash';
        actionButton.textContent = '🗑️';

        actionButton.addEventListener('click', () => {
            if (!isInSentFolder) {
                moveMailsToFolder(selectedMailIds, 'Trash');
            } else if (isInSentFolder) {
                // Loop through selectedMailIds to find the corresponding mail objects
                selectedMailIds.forEach(mailId => {
                    const mail = mails.find(m => m.id === Number(mailId));  // Convert to the same type
                    
                    if (mail) {
                        mail.action = 'hide';
                        mailsync.push(mail);  // Add to the mailsync array for syncing actions
                        syncMail();  // Call syncMail function to reflect changes
                    }
                });
                deleteMails(selectedMailIds);  // Assume you have a function to remove the mail from the 'mails' array

            }
        });
    } else if (folderName === 'Trash') {
        actionButton = document.createElement('button');
        actionButton.id = 'actionButton';
        actionButton.className = 'address-book-btn-restore';
        actionButton.textContent = '🔄';

        actionButton.addEventListener('click', () => {
            moveMailsToFolder(selectedMailIds, 'Inbox');
        });

        // Logic for creating Delete button
        deleteButton = document.createElement('button');
        deleteButton.id = 'deleteButton';
        deleteButton.className = 'address-book-btn-trash';
        deleteButton.textContent = '❌';

        deleteButton.addEventListener('click', () => {
            selectedMailIds.forEach(mailId => {
                const mail = mails.find(m => m.id === Number(mailId));  // Convert to the same type
                
                if (mail) {
                    mail.action = 'delete';
                    mailsync.push(mail);  // Add to the mailsync array for syncing actions
                    syncMail();  // Call syncMail function to reflect changes
                }
            });
            deleteMails(selectedMailIds);
        });
    }

    // Append new action buttons to contentContainer
    if (moveButton) {
        contentContainer.appendChild(moveButton);
    }
    if (actionButton) {
        contentContainer.appendChild(actionButton);
    }
    if (deleteButton) {
        contentContainer.appendChild(deleteButton);
    }
}
function filterMails(query, condition) {
    if (mails.length === 0) {
        return [];
    }

    let filteredMails = mails.map(mail => {
        mail.to == mail.toNames;
        if (typeof mail.to === 'string') {
            mail.to = JSON.parse(mail.to);
        }
        if (typeof mail.toNames === 'string') {
            mail.toNames = JSON.parse(mail.toNames);
        }
        return mail;
    }).filter(mail => {
        if (condition) {
            const conditionResult = condition(mail);
            return conditionResult;
        }
        return true;
    });

    if (query) {
        query = query.toLowerCase();
        filteredMails = filteredMails.filter(mail => {
            const toNamesStr = Array.isArray(mail.toNames) ? mail.toNames.join(' ').toLowerCase() : '';
            return mail.fromName.toLowerCase().includes(query) ||
                   mail.subject.toLowerCase().includes(query) ||
                   mail.date.includes(query) ||
                   new Date(mail.date).toLocaleTimeString().includes(query) ||
                   toNamesStr.includes(query);
        });
    }

    return filteredMails;
}
// Main function to render mails
function renderMails(folderName, poBoxFilter, condition, isInSentFolder) {
    clearContentContainer();

    const mailsList = createMailList(contentContainer);
    let selectButton;
    let selectAllButton;
    let filteredMails;
    const filterAndSortMails = (query) => {
        filteredMails = filterMails(query, condition);
        filteredMails.sort((a, b) => new Date(b.date) - new Date(a.date));
        if (filteredMails.length > contactsPerPage && !query) {
            const startIndex = (mailsCurrentPage.value - 1) * contactsPerPage;
            const endIndex = startIndex + contactsPerPage;
        
            // Render only contacts for the current page
            const MailtoRender = filteredMails.slice(startIndex, endIndex);
    
            sortAndRenderMails(MailtoRender, mailsList, poBoxFilter);
        } else {
            sortAndRenderMails(filteredMails, mailsList, poBoxFilter);
        }
        if (filteredMails.length > 0) {
            if (!selectButton) {
                selectButton = document.createElement('button');
                selectButton.className = 'address-book-btn';
                selectButton.textContent = 'Select';
                
                selectButton.addEventListener('click', () => {
                    isSelectMode2 = !isSelectMode2;

                    if (isSelectMode2) {
                        selectButton.textContent = 'Cancel';
                        addCheckboxesToMails(folderName, isInSentFolder);
                        updateActionButtons(folderName, isInSentFolder);

                        if (!selectAllButton) {
                            selectAllButton = document.createElement('button');
                            selectAllButton.className = 'address-book-btn';
                            selectAllButton.textContent = 'Select All';
                            selectAllButton.addEventListener('click', () => {
                                const checkboxes = document.querySelectorAll('.mail-select-checkbox');
                                if (selectAllButton.textContent === 'Select All') {
                                    checkboxes.forEach(checkbox => {
                                        checkbox.checked = true;
                                        const mailId = checkbox.getAttribute('data-mail-id');
                                        if (!selectedMailIds.includes(mailId)) {
                                            selectedMailIds.push(mailId);  // Add to selectedMailIds array
                                        }
                                    });
                                    selectAllButton.textContent = 'Unselect All';
                                } else {
                                    checkboxes.forEach(checkbox => {
                                        checkbox.checked = false;
                                        const mailId = checkbox.getAttribute('data-mail-id');
                                        const index = selectedMailIds.indexOf(mailId);
                                        if (index > -1) {
                                            selectedMailIds.splice(index, 1);  // Remove from selectedMailIds array
                                        }
                                    });
                                    selectAllButton.textContent = 'Select All';
                                }
                                updateActionButtons(folderName, isInSentFolder);  // Update the action buttons
                            });
                            contentContainer.appendChild(selectAllButton);
                        }
                    } else {
                        selectButton.textContent = 'Select';
                        removeCheckboxesFromMails();
                        selectedMailIds = [];
                        updateActionButtons(folderName, isInSentFolder);

                        if (selectAllButton) {
                            selectAllButton.remove();
                            selectAllButton = null;
                        }
                    }
                });
            }
        }
        const actionButtonsContainer = document.createElement('div');
        actionButtonsContainer.className = 'action-buttons-container';
        contentContainer.appendChild(actionButtonsContainer);
    
        
        // Create pagination only if it doesn't already exist and you are loading more than one page
        if (filteredMails.length > contactsPerPage && !document.querySelector('.pagination')) {
            const startIndex = (mailsCurrentPage.value - 1) * contactsPerPage;
            const endIndex = startIndex + contactsPerPage;
        
            // Render only contacts for the current page
            const MailtoRender = filteredMails.slice(startIndex, endIndex);
            const paginationDiv = createPagination(filteredMails.length, 1, (newPage) => {
                // Assuming you have a global or outer scope variable named mailsCurrentPage similar to contactsCurrentPage
                mailsCurrentPage.value = newPage;
                filterAndSortMails(query);  // This is your onPageChange logic
                //sortAndRenderMails(MailtoRender, mailsList, poBoxFilter);
            }, mailsCurrentPage);
    
            // Insert pagination above the actionButtonsContainer
            contentContainer.insertBefore(paginationDiv, actionButtonsContainer);
        }
    };
    const searchBar = createSearchBar('🔍 Search Mail', () => {
        filterAndSortMails(searchBar.value)
    });
    contentContainer.insertBefore(searchBar, contentContainer.firstChild);

    filterAndSortMails('');

    if (navigatedFromFolderList) {
        const backBtn = document.createElement('button');
        backBtn.className = 'address-book-btn';
        backBtn.textContent = 'Back';
        backBtn.addEventListener('click', () => {
            isSelectMode2 = false;
            selectedMailIds = [];
            navigatedFromFolderList = false;
            renderFolders();
        });
        contentContainer.appendChild(backBtn);
    }
    if (selectButton) {
        contentContainer.appendChild(selectButton);
    }
}

function createFolderModal(folders, mailOrMailIds) {
    // Corrected query selector
    const existingModal = document.querySelector('.folder-modal');
    if (existingModal) {
        existingModal.remove();
    }

    const modal = document.createElement('div');
    modal.className = 'folder-modal';
    const isBulk = Array.isArray(mailOrMailIds);
    const mailIds = isBulk ? mailOrMailIds : [mailOrMailIds.id]; // mailOrMailIds.id assumes that 'id' is your unique identifier
    // Create a header element and set its text to "Folders"
    const header = document.createElement('h2');
    header.textContent = 'Folders';
    modal.appendChild(header);  // Append the header to the modal

    const label = document.createElement('label');
    modal.appendChild(label);

    const folderList = document.createElement('ul');

    // Change this loop to use folder.name
    folders.forEach((folderObj, index) => {
        const folderItem = document.createElement('li');
        folderItem.textContent = folderObj.name;  // Change here
        // Attach event handler
        handleFolderItemClick(folderItem, folderObj.name, mailIds);  // Change here
        folderList.appendChild(folderItem);
    });
    modal.appendChild(folderList);
    setTimeout(() => {
        document.body.appendChild(modal);
    }, 50); // 50 milliseconds delay
}
function viewMail(index) {
        const mail = mails[index];
        const isInSentFolder = mail.folder === 'Inbox' && mail.from === viewerPOBox;

        clearContentContainer();
    
        // Create elements and set their innerHTML
        const fromElement = document.createElement('p');
        const toElement = document.createElement('p');
        toElement.className = 'to-section'; // Add this line
        const subjectElement = document.createElement('p');
        const bodyElement = document.createElement('p');
        const bodyContentElement = document.createElement('div');
        let replyButton, replyAllButton;
        if (!mail.read) {
            mail.read = true;       // Set the mail as read
            mail.action = 'read';   // Add an action property to the mail
            mailsync.push(mail);    // Push the modified mail object to the mailsync array
            syncMail();             // Call the syncMail function to perform the sync
        }
        fromElement.innerHTML = `<strong>From:</strong> ${mail.from}`;
        // Updated to handle multiple recipients
        const toNames = mail.toNames ? mail.toNames.join(', ') : mail.to;
        toElement.innerHTML = `<strong>To:</strong> ${toNames}`;
        subjectElement.innerHTML = `<strong>Subject:</strong> ${mail.subject}`;
        bodyElement.innerHTML = `<strong>Body:</strong>`;
        bodyContentElement.innerHTML = mail.body;
    
        // Style adjustments for squeezing lines closer together
    
        // Assign a class for styling
        bodyContentElement.className = 'mail-body';  // This class should be defined in your CSS
        // Convert PO boxes to strings for comparison
        const strViewerPOBox = String(viewerPOBox);
        
        // Check if the sender exists in the contacts list and get the name
        const senderContact = contacts.find(c => String(c.poBox) === String(mail.from));
        const senderName = senderContact ? senderContact.name : mail.from;
        
        if (mail.anon === true) {
            fromElement.innerHTML = "<strong>From:</strong> Anonymous";
        } else {
            fromElement.innerHTML = `<strong>From:</strong> ${senderName}`;
        }
    
        // Get names for the recipients
        const formattedTo = mail.to.map(address => {
            const strAddress = String(address);
            const contact = contacts.find(c => String(c.poBox) === strAddress);
            return contact ? `${contact.name} (${strAddress})` : `(${strAddress})`;
        }).join(', ');
    
        toElement.innerHTML = `<strong>To:</strong> ${formattedTo}`;


        // Add date right above the subject line
        const dateElement = document.createElement('p');
        dateElement.innerHTML = `<strong>Date:</strong> ${formatToLocalDateTime(mail.date)}`;
        // Append these to contentContainer
        contentContainer.appendChild(fromElement);
        contentContainer.appendChild(toElement);
        contentContainer.appendChild(dateElement);
        contentContainer.appendChild(subjectElement);
        contentContainer.appendChild(bodyElement);
        contentContainer.appendChild(bodyContentElement);
        // Inside viewMail function
        

        // Create "Back" button to go back to the folder where the mail is located
        const backButton = document.createElement('button');
        backButton.textContent = 'Back';
        backButton.className = 'address-book-btn';

        backButton.addEventListener('click', () => {
            if (mail.folder === 'Inbox') {
                // If the sender is the viewer, go to Sent mail list
                if (mail.from === viewerPOBox) {
                    renderFolderSpecificMails('Sent');
                } else {
                    // Otherwise, go back to the Inbox
                    renderFolderSpecificMails('Inbox');
                }
            } else {
                // For other folders, go back to the folder the mail was in
                renderFolderSpecificMails(mail.folder);
            }
        });


        contentContainer.appendChild(backButton);
        if (editableFolders.length > 0 && ((mail.folder === 'Inbox' && mail.from !== viewerPOBox) || editableFolders.includes(mail.folder))) {
            const moveButton = document.createElement('button');
            moveButton.innerText = 'Move';
            moveButton.className = 'address-book-btn';  // Your class for styling buttons
            
            // Add event listener to the 'Move' button
            moveButton.addEventListener('click', function() {
                event.stopPropagation();
                let folderOptions = editableFolders.slice();  // Create a copy of editableFolders
        
                // Include 'Inbox' if current folder is an editable folder
                if (editableFolders.includes(mail.folder)) {
                    folderOptions.push('Inbox');
                }
        
                createFolderModal(folderOptions,mail);
            });
        
            contentContainer.appendChild(moveButton);
        }

        // Create "Forward" button
        const forwardButton = document.createElement('button');
        forwardButton.textContent = 'Forward';
        forwardButton.className = 'address-book-btn';  // Your class for styling buttons
        
        forwardButton.addEventListener('click', () => {
            renderSendLetterPage();  // Assuming this function renders the send letter page
            selectedContacts.clear();  // Clear selectedContacts (if applicable)

            // Auto-fill Subject with "Fwd:" prefix
            document.getElementById('subjectInput').value = 'Fwd: ' + mail.subject;

            // Copy the original message into the body input, wrapped in forwarding text
            const forwardedContent = `
                ---------- Forwarded message ---------<br>
                <strong>From:</strong> ${fromElement.innerHTML}<br>
                <strong>To:</strong> ${formattedTo}<br>
                <strong>Date:</strong> ${formatToLocalDateTime(mail.date)}<br>
                <strong>Body:</strong><br>
                ${mail.body}<br>
                --------------------------------------------<br>
            `;
            const letterContentDiv = document.getElementById('letterContent');
            if (letterContentDiv) {
                letterContentDiv.innerHTML = forwardedContent;
            }
        });

        contentContainer.appendChild(forwardButton);
        
        //reply buttons
        if (!isInSentFolder) {
            // Create "Reply" button
            replyButton = document.createElement('button');
            replyButton.textContent = 'Reply';
            replyButton.className = 'address-book-btn';
            
            replyButton.addEventListener('click', () => {
                renderSendLetterPage();
                selectedContacts.clear();
                
                // Check if the sender exists in the contacts list
                const existingSenderContact = contacts.find(c => c.poBox === mail.from);
                if (existingSenderContact) {
                    selectedContacts.add(existingSenderContact.name); // Add the name to selectedContacts
                } else {
                    selectedContacts.add(mail.from); // Add the PO number to selectedContacts
                }
                
                updateRecipientBubble();  // Update the bubble UI
                document.getElementById('subjectInput').value = 'Re: ' + mail.subject;
            });
            contentContainer.appendChild(replyButton);

            // Create "Reply All" button if more than 1 person in To field
            if (mail.to.length > 1) {
                replyAllButton = document.createElement('button');
                replyAllButton.textContent = 'Reply All';
                replyAllButton.className = 'address-book-btn';
            
                replyAllButton.addEventListener('click', () => {
                    renderSendLetterPage();
                    selectedContacts.clear();
            
                    // Add sender and all other recipients except the reader to selectedContacts and update the bubble
                    const addToSelectedContacts = (address) => {
                        const existingContact = contacts.find(c => c.poBox === address);
                        if (existingContact) {
                            selectedContacts.add(existingContact.name); // Add the name to selectedContacts
                        } else {
                            selectedContacts.add(address); // Add the PO number to selectedContacts
                        }
                    };
            
                    addToSelectedContacts(mail.from);
            
                    mail.to.forEach(address => {
                        if (address !== viewerPOBox) {
                            addToSelectedContacts(address);
                        }
                    });
            
                    updateRecipientBubble();  // Update the bubble UI
                    document.getElementById('subjectInput').value = 'Re: ' + mail.subject;
                });
            
                contentContainer.appendChild(replyAllButton);
            }
        }

        
        // Create "Trash" button to move the mail to the Trash folder
        if ((mail.folder === 'Inbox' || editableFolders.includes(mail.folder)) && mail.folder !== 'Trash') {
            const trashButton = document.createElement('button');
            trashButton.textContent = '🗑️';
            trashButton.className = 'address-book-btn-trash';  // Your class for styling buttons
            const originalFolder = mail.folder;
            trashButton.addEventListener('click', () => {
                // Update the folder of the mail to "Trash"
                if (isInSentFolder) { 
                    mail.action = 'hide';
                    mailsync.push(mail);  // Add to the mailsync array for syncing actions
                    // Assuming you have a function to remove the mail from the 'mails' array
                    deleteMails(mail.id,isInSentFolder);  // Replace with your actual function
                    syncMail()
                } else {
                    mail.folder = 'Trash';
                    mail.action = 'update';
                    mailsync.push(mail);  // Add to the mailsync array for syncing actions
                    syncMail();  // Call syncMail function to reflect changes
                }
                
                renderFolderSpecificMails(mail.folder === 'Inbox' && mail.from !== viewerPOBox ? 'Inbox' : mail.folder);
                renderFolderSpecificMails(originalFolder);
            });
        
            contentContainer.appendChild(trashButton);

        }
        if (mail.folder === 'Trash') {
            const restoreButton = document.createElement('button');
            restoreButton.textContent = '🔄';
            restoreButton.className = 'address-book-btn-restore';  // Your class for styling buttons
            const originalFolder = mail.folder;
            restoreButton.addEventListener('click', () => {
                // Update the folder of the mail to "Inbox"
                mail.folder = 'Inbox';
                mail.action = 'update';
                mailsync.push(mail);  // Add to the mailsync array for syncing actions
                syncMail();  // Call syncMail function to reflect changes
                // Refresh the mail list to reflect the change
                renderFolderSpecificMails('Inbox');
                renderFolderSpecificMails(originalFolder);
            });
            const deleteButton = document.createElement('button');
            deleteButton.textContent = '❌';
            deleteButton.className = 'address-book-btn-trash';  // Your class for styling buttons
            
            deleteButton.addEventListener('click', () => {
                // Delete the mail
                mail.action = 'delete';
                mailsync.push(mail);  // Add to the mailsync array for syncing actions
                syncMail();  // Call syncMail function to reflect changes
                deleteMails(mail.id); // Assuming deleteMails function is modified to handle single id as well
        
                // Refresh the mail list to reflect the change
                renderFolderSpecificMails('Trash');
            });
            contentContainer.appendChild(restoreButton);
            contentContainer.appendChild(deleteButton);
        }
        if (mail.anon === true) {
            if (replyButton) replyButton.style.display = 'none';
            if (replyAllButton) replyAllButton.style.display = 'none';
        }
        updateUnreadCount();
}


function viewContact(indexOrContact) {
        const contact = (typeof indexOrContact === 'number') ? contacts[indexOrContact] : indexOrContact;
        clearContentContainer();
    
        // Create elements and set their innerHTML
        const nameElement = document.createElement('p');
        const poBoxElement = document.createElement('p');
        const notesElement = document.createElement('p');
    
        nameElement.innerHTML = `<strong>Name:</strong> <span contenteditable='true'>${contact.name}</span>`;
        poBoxElement.innerHTML = `<strong>PO Box:</strong> <span contenteditable='true'>${contact.poBox}</span>`;
        notesElement.innerHTML = `<strong>Notes:</strong> <span contenteditable='true'>${contact.notes}</span>`;
    
        // Append these to contentContainer
        contentContainer.appendChild(nameElement);
        contentContainer.appendChild(poBoxElement);
        contentContainer.appendChild(notesElement);
    
        // Create Save and Delete buttons
        const saveBtn = document.createElement('button');
        saveBtn.className = 'address-book-btn';
        saveBtn.textContent = 'Save';
        saveBtn.style.display = 'none';  // Initially hidden
    
        saveBtn.addEventListener('click', () => {
            contact.name = nameElement.querySelector('span').innerText;
            contact.poBox = poBoxElement.querySelector('span').innerText;
            contact.notes = notesElement.querySelector('span').innerText;
            const editedContact = {
                ...contact,
                action: 'edited'  // action property to identify the operation
            };
            contactsToSync.push(editedContact);  // Add the edited contact to contactsToSync
            syncContacts();
            renderContacts();
        });
    
        const deleteBtn = document.createElement('button');
        deleteBtn.className = 'address-book-btn';
        deleteBtn.textContent = 'Delete';
        deleteBtn.addEventListener('click', () => {
            const deletedContact = {
                ...contact,  // Use the determined contact object
                action: 'deleted'
            };
            const indexToDelete = (typeof indexOrContact === 'number') ? indexOrContact : contacts.indexOf(contact);
            contacts.splice(indexToDelete, 1);
            contactsToSync.push(deletedContact);  // Add the deleted contact to contactsToSync
            syncContacts();
            renderContacts();
        });
        // Create 'View Mails' button
        const viewMailsBtn = document.createElement('button');
        viewMailsBtn.className = 'address-book-btn';
        viewMailsBtn.textContent = 'View Mails';
        
        viewMailsBtn.addEventListener('click', () => {
            renderMails(
                null, 
                null, 
                mail => mail.from === contact.poBox && 
                        mail.folder !== 'Trash' && 
                        mail.folder !== 'Sent' && 
                        !mail.anon  // Assuming 'isAnonymous' is the property that marks a mail as anonymous
            );
        });
        
        // Append 'View Mails' button to contentContainer
        contentContainer.appendChild(viewMailsBtn);
        const backBtn = document.createElement('button');
        backBtn.className = 'address-book-btn';
        backBtn.textContent = 'Back';
        backBtn.addEventListener('click', renderContacts);
    
        // Listen for changes and show Save button
        [nameElement, poBoxElement, notesElement].forEach(element => {
            element.querySelector('span').addEventListener('input', () => {
                saveBtn.style.display = 'inline';  // Show Save button when input changes
            });
        });
    
        // Append buttons to contentContainer
        contentContainer.appendChild(backBtn);
        contentContainer.appendChild(saveBtn);
        contentContainer.appendChild(deleteBtn);
        contentContainer.appendChild(viewMailsBtn);
}
function createNewContact() {
    clearContentContainer();
    // Create form container
    const formContainer = document.createElement('div');
    formContainer.id = 'formContainer';

    // Create input fields and labels
    const nameLabel = document.createElement('label');
    nameLabel.textContent = 'Name:';
    const nameInput = document.createElement('input');
    nameInput.type = 'text';
    const nameField = document.createElement('div');
    nameField.className = 'inputField';
    nameField.appendChild(nameLabel);
    nameField.appendChild(nameInput);

    const poBoxLabel = document.createElement('label');
    poBoxLabel.textContent = 'PO Box:';
    const poBoxInput = document.createElement('input');
    poBoxInput.type = 'text';
    const poBoxField = document.createElement('div');
    poBoxField.className = 'inputField';
    poBoxField.appendChild(poBoxLabel);
    poBoxField.appendChild(poBoxInput);

    const notesLabel = document.createElement('label');
    notesLabel.textContent = 'Notes:';
    const notesInput = document.createElement('textarea');
    notesInput.id = 'notes';
    notesInput.style.backgroundColor = 'transparent';
    const notesField = document.createElement('div');
    notesField.className = 'inputField';
    notesField.appendChild(notesLabel);
    notesField.appendChild(notesInput);

    // Create Save and Back buttons
    const saveBtn = document.createElement('button');
    saveBtn.textContent = 'Save';
    saveBtn.className = 'address-book-btn';  // Add the button class for styling

    saveBtn.addEventListener('click', () => {
        const newContact = {
            name: nameInput.value,
            poBox: poBoxInput.value,
            notes: notesInput.value,
            action: 'added'  // action property to identify the operation
        };
        contacts.push(newContact);
        contactsToSync.push(newContact);  // Add the new contact to contactsToSync
        syncContacts(true);
        renderContacts();
    });

    const backBtn = document.createElement('button');
    backBtn.textContent = 'Back';
    backBtn.className = 'address-book-btn';  // Add the button class for styling

    backBtn.addEventListener('click', renderContacts);

    // Append these to formContainer
    formContainer.appendChild(nameField);
    formContainer.appendChild(poBoxField);
    formContainer.appendChild(notesField);
    formContainer.appendChild(saveBtn);
    formContainer.appendChild(backBtn);

    // Append formContainer to contentContainer
    contentContainer.appendChild(formContainer);
}

function moveMailsFromFolderToTrash(folderName) {

    // Move all mails from the specified folder to Trash
    mails.forEach(mail => {
        if (mail.folder === folderName) {
            mail.folder = 'Trash';
            mail.action = 'update';
            mailsync.push(mail);  // Add to the mailsync array for syncing actions
            syncMail();  // Call syncMail function to reflect changes
        }
    });
}
function renderFolderSpecificMailsById(folderId) {

    isSelectMode2 = false;
    selectedMailIds = [];
    updateUnreadCount();
    
    // Assuming your mail object has a property folderId
    const condition = mail => mail.folderId === folderId;  
    
    renderMails('Custom Folder', null, condition, false); // replace 'Custom Folder' and false with actual values if needed
}

function filterAndSortFolders(allFolders, query) {
    const mainFolders = ['Inbox', 'Sent', 'Trash'];
    const editableFolders = allFolders.filter(folder => !mainFolders.includes(folder));

    // Sort the editable folders alphabetically
    editableFolders.sort((a, b) => {
        return a.toLowerCase().localeCompare(b.toLowerCase(), undefined, {numeric: true, sensitivity: 'base'});
    });

    // Create a new array that starts with the main folders and then includes the sorted editable folders
    let combinedFolders = [...mainFolders, ...editableFolders];

    // Filter folders by query
    if (query) {
        combinedFolders = combinedFolders.filter(folder => folder.toLowerCase().includes(query));
    }

    return combinedFolders;
}

function renderFolders() {
    // Clear the content container
    clearContentContainer();
    
    let query;
    let combinedFolders;
    const searchBar = createSearchBar('🔍 Search Folders', () => {
        renderFilteredFolders(searchBar.value.toLowerCase());
    });
    contentContainer.insertBefore(searchBar, contentContainer.firstChild);

    // Create and append the folders list
    const foldersList = document.createElement('ul');
    foldersList.id = 'foldersList';
    contentContainer.appendChild(foldersList);

    function renderFilteredFolders(queryx, page) {
        query = queryx;
        foldersList.innerHTML = '';
        // Sort editableFolders and filter
        if (editableFolders.length > 0) {
            editableFolders.sort((a, b) => a.name.toLowerCase().localeCompare(b.name.toLowerCase()));
        }
        combinedFolders = filterAndSortFolders(editableFolders.map(folder => folder.name), query);
        let foldersToRender;
        if (page !== undefined) {
            const startIndex = (page - 1) * contactsPerPage;
            const endIndex = startIndex + contactsPerPage;
            foldersToRender = combinedFolders.slice(startIndex, endIndex);
        } else {
            foldersToRender = combinedFolders;
        }
        
        // The actual rendering logic
        foldersToRender.forEach((folderObj) => {
            const folderItem = document.createElement('li');
            const folderNameSpan = document.createElement('span');
            folderNameSpan.textContent = folderObj;
            folderItem.appendChild(folderNameSpan);

            folderItem.addEventListener('click', () => {
                if (isSelectMode) {
                    const checkbox = folderItem.querySelector('.folder-checkbox');
                    if (checkbox) {
                        checkbox.checked = !checkbox.checked;
                        const event = new Event('change', { 'bubbles': true });
                        checkbox.dispatchEvent(event);
                    }
                } else {
                    navigatedFromFolderList = true;
                    // Use folderId if it exists, otherwise fall back to folderName
                    const folderId = folderObj.id ? folderObj.id : null;
                    const folderName = folderObj.name ? folderObj.name : folderNameSpan.textContent;
                    if (folderId) {
                        renderFolderSpecificMailsById(folderId);  // Function to handle folder by ID
                    } else {
                        renderFolderSpecificMails(folderName);  // Existing function to handle folder by name
                    }
                }
            });

            if (isSelectMode && editableFolders.some(e => e.name === folderObj)) {
                const checkbox = document.createElement('input');
                checkbox.type = 'checkbox';
                checkbox.className = 'folder-checkbox';
                folderItem.prepend(checkbox);
            }
            foldersList.appendChild(folderItem);
        });
        let existingPaginationDiv = document.getElementById('paginationDiv');
        if (!existingPaginationDiv && combinedFolders.length > contactsPerPage) {
            const paginationDiv = createPagination(combinedFolders.length, contactsPerPage, (newPage) => {
                renderFilteredFolders(query, newPage);
            }, foldersCurrentPage);
            paginationDiv.id = 'paginationDiv';
            if (paginationDiv) {
                contentContainer.appendChild(paginationDiv);
            }
        }
    }

    renderFilteredFolders('', 1);

    /// Create and append 'Select' button
    const selectBtn = document.createElement('button');
    selectBtn.textContent = isSelectMode ? 'Cancel' : 'Select';
    selectBtn.className = 'address-book-btn';
    selectBtn.addEventListener('click', () => {
        isSelectMode = !isSelectMode;
        renderFolders();
    });
    if (editableFolders.length > 0) {
        contentContainer.appendChild(selectBtn);
    }

    // Create and append 'Create Folder' button
    const createFolderBtn = document.createElement('button');
    createFolderBtn.textContent = 'Create Folder';
    createFolderBtn.className = 'address-book-btn';
    createFolderBtn.addEventListener('click', () => {
        customPrompt('Enter new folder name:', (newFolderName) => {
            if (newFolderName) {
                folders.push(newFolderName);
                editableFolders.push({"name": newFolderName});
                foldersToSync.push({"name": newFolderName, "action": "added"}); 
                renderFolders();
                syncFolders(true);
            }
        });
    });
    if (!isSelectMode) {
        contentContainer.appendChild(createFolderBtn);
    }
    

    if (isSelectMode) {
        const editBtn = document.createElement('button');
        editBtn.textContent = 'Rename';
        editBtn.className = 'address-book-btn';
        editBtn.style.display = 'none';
        contentContainer.appendChild(editBtn);

        const saveBtn = document.createElement('button');
        saveBtn.textContent = 'Save';
        saveBtn.className = 'address-book-btn';
        saveBtn.style.display = 'none';
        contentContainer.appendChild(saveBtn);

        const deleteBtn = document.createElement('button');
        deleteBtn.textContent = '❌';
        deleteBtn.className = 'address-book-btn-trash';  // Your class for styling buttons
        deleteBtn.style.display = 'none';
        contentContainer.appendChild(deleteBtn);

        foldersList.addEventListener('change', () => {
            const checkboxes = document.querySelectorAll('.folder-checkbox:checked');
            if (checkboxes.length > 0) {
                editBtn.style.display = 'inline-block';
                deleteBtn.style.display = 'inline-block';
            } else {
                editBtn.style.display = 'none';
                deleteBtn.style.display = 'none';
            }
        });

        editBtn.addEventListener('click', () => {
            const checkboxes = document.querySelectorAll('.folder-checkbox:checked');
            checkboxes.forEach(checkbox => {
                const folderItem = checkbox.parentElement;
                const originalName = folderItem.textContent;
                folderItem.setAttribute('data-original-name', originalName);
                folderItem.innerHTML = '';
                const inputBox = document.createElement('input');
                inputBox.type = 'text';
                inputBox.className = 'folder-input';
                inputBox.value = originalName;
                inputBox.addEventListener('keyup', (event) => {
                    if (event.keyCode === 13) {
                        saveBtn.click();
                    }
                });
                folderItem.appendChild(inputBox);
            });
            editBtn.style.display = 'none';
            deleteBtn.style.display = 'none';
            saveBtn.style.display = 'inline-block';
        });

        saveBtn.addEventListener('click', () => {
            const inputBoxes = document.querySelectorAll('.folder-input');
            inputBoxes.forEach(inputBox => {
                const folderItem = inputBox.parentElement;
                const originalName = folderItem.getAttribute('data-original-name');
                const folderObj = editableFolders.find(folder => folder.name === originalName);
                if (folderObj) {
                    folderObj.name = inputBox.value;
                    folderObj.action = "edited";
                    foldersToSync.push(folderObj);
                }
            });
            isSelectMode = false;
            renderFolders();
            syncFolders();
        });

        deleteBtn.addEventListener('click', () => {
            const checkboxes = document.querySelectorAll('.folder-checkbox:checked');
            checkboxes.forEach(checkbox => {
                const folderItem = checkbox.parentElement;
                const folderName = folderItem.textContent.trim(); // Make sure this is correct
        
                // Remove the folder from the folders and editableFolders arrays
                const index = folders.indexOf(folderName);
                if (index > -1) {
                    folders.splice(index, 1);
                }
                
                const editableIndex = editableFolders.findIndex(e => e.name === folderName);
                if (editableIndex > -1) {
                    const deletedFolder = editableFolders[editableIndex];
                    deletedFolder.action = "deleted";
                    foldersToSync.push(deletedFolder);
                    editableFolders.splice(editableIndex, 1);
                }
        
                // Move all mails from this folder to Trash
                moveMailsFromFolderToTrash(folderName);
                
                // Remove the folder item from the DOM
                folderItem.remove();
            });
            if (editableFolders.length === 0) {
                isSelectMode = false;
            }
            // Refresh folder list
            renderFolders();
            syncFolders();
        });
    }
}
function createSearchBar(placeholderText, onInputCallback) {
    const searchBar = document.createElement('input');
    searchBar.type = 'text';
    searchBar.id = 'searchInput';
    searchBar.placeholder = placeholderText;
    searchBar.addEventListener('input', onInputCallback);
    return searchBar;
}

function createPagination(totalItems, itemsPerPage, onPageChange, currentPageRef) {
    if (totalItems <= itemsPerPage) return null;

    const paginationDiv = document.createElement('div');
    paginationDiv.className = 'pagination';
    const totalPages = Math.ceil(totalItems / itemsPerPage);
    let isReplaced = false; // Flag to check if input is already replaced

    const updateBoldButton = (newCurrentPage) => {
        paginationDiv.querySelectorAll('button').forEach((btn) => {
            btn.textContent == newCurrentPage ? btn.classList.add('bold') : btn.classList.remove('bold');
        });
    };

    const createPageElement = (text, isEllipsis = false) => {
        let element;
        if (isEllipsis) {
            element = document.createElement('button');
            element.textContent = '...';
            element.addEventListener('click', () => {
                isReplaced = false; // Reset flag
                const input = document.createElement('input');
                input.type = 'number';
                input.style.width = '50px';

                input.addEventListener('change', () => {
                    if (isReplaced) return; // Skip if already replaced
                    const newPage = parseInt(input.value, 10);
                    if (newPage >= 1 && newPage <= totalPages) {
                        currentPageRef.value = newPage;
                        updateBoldButton(newPage);
                        onPageChange(newPage);
                    }
                    if (input.parentNode) {
                        input.parentNode.replaceChild(element, input);
                        isReplaced = true; // Set flag
                    }
                });
                
                input.addEventListener('blur', () => {
                    setTimeout(() => {
                        if (isReplaced) return; // Skip if already replaced
                        if (input.parentNode) {
                            input.parentNode.replaceChild(element, input);
                            isReplaced = true; // Set flag
                        }
                    }, 0);
                });

                element.parentNode.replaceChild(input, element);
                input.focus();
            });
        } else {
            element = document.createElement('button');
            element.textContent = text;
            if (parseInt(text, 10) === currentPageRef.value) element.classList.add('bold');
            element.addEventListener('click', () => {
                let newPage = parseInt(text, 10);
                if (text === '<') {
                    if (currentPageRef.value <= 1) return;
                    newPage = currentPageRef.value - 1;
                } else if (text === '>') {
                    if (currentPageRef.value >= totalPages) return;
                    newPage = currentPageRef.value + 1;
                }
                if (newPage >= 1 && newPage <= totalPages) {
                    currentPageRef.value = newPage;
                    updateBoldButton(newPage);
                    onPageChange(newPage);
                }
            });
        }
        return element;
    };

    paginationDiv.appendChild(createPageElement('<'));
    for (let i = 1; i <= Math.min(3, totalPages); i++) {
        paginationDiv.appendChild(createPageElement(i.toString()));
    }
    if (totalPages > 6) {
        paginationDiv.appendChild(createPageElement('...', true));
    }
    for (let i = Math.max(4, totalPages - 2); i <= totalPages; i++) {
        paginationDiv.appendChild(createPageElement(i.toString()));
    }
    paginationDiv.appendChild(createPageElement('>'));

    return paginationDiv;
}

function renderContactsPage(filteredContacts = null) {
    const contactList = document.getElementById('contactsList');
    contactList.innerHTML = '';

    const contactsToRender = filteredContacts || contacts;

    contactsToRender.forEach((contact, index) => {
        const listItem = document.createElement('li');
        listItem.textContent = contact.name;

        // Adding a click event to navigate to the contact page
        listItem.addEventListener('click', () => {
            if (!isSelectModeForContacts) {
                viewContact(contact);  // Pass the actual contact object
            }
        });

        if (isSelectModeForContacts) {
            const checkbox = document.createElement('input');
            checkbox.type = 'checkbox';
            checkbox.className = 'contact-checkbox';
            checkbox.value = index;
            checkbox.addEventListener('change', updateDeleteBtn);
            listItem.prepend(checkbox);
        }

        contactList.appendChild(listItem);
    });
}

function renderContacts() {
    clearContentContainer();

    const actionButtonsContainer = document.createElement('div');
    actionButtonsContainer.className = 'action-buttons-container';
    
    // Add the "Select" button back in
    if (contacts.length > 0) {
        const selectModeBtn = document.createElement('button');
        selectModeBtn.textContent = isSelectModeForContacts ? 'Cancel' : 'Select';
        selectModeBtn.className = 'address-book-btn';
        selectModeBtn.addEventListener('click', () => {
            isSelectModeForContacts = !isSelectModeForContacts;
            renderContacts();
        });
        actionButtonsContainer.appendChild(selectModeBtn);
    }
    
    if (contacts.length > contactsPerPage) {
        
    }
    
    const startIndex = (contactsCurrentPage.value - 1) * contactsPerPage;
    const endIndex = startIndex + contactsPerPage;

    // Render only contacts for the current page
    const contactsToRender = contacts.slice(startIndex, endIndex);



    const searchBar = createSearchBar('🔍 Search Contacts', function() {
        const query = this.value.toLowerCase();
        const filteredContacts = contacts.filter(contact => contact.name.toLowerCase().includes(query));
        renderContactsPage(filteredContacts);
    });

    const contactsList = document.createElement('ul');
    contactsList.id = 'contactsList';
    
    // Insert the search bar before the contactsList
    contentContainer.appendChild(searchBar);

    contentContainer.appendChild(contactsList);

    contentContainer.appendChild(actionButtonsContainer);

    if (contacts.length > contactsPerPage && !document.querySelector('.pagination')) {
        // Added a new function to handle page changes
        const onPageChange = (newPage) => {
            contactsCurrentPage.value = newPage;
            renderContacts();  // Re-render the contacts for the new page
        };
        
        // Create the pagination Div
        const paginationDiv = createPagination(contacts.length, contactsPerPage, onPageChange, contactsCurrentPage);
        
        if (paginationDiv !== null) {
            contentContainer.insertBefore(paginationDiv, actionButtonsContainer);
        }
    }

    const selectAllBtn = document.createElement('button');
    selectAllBtn.textContent = 'Select All';
    selectAllBtn.className = 'address-book-btn';
    selectAllBtn.addEventListener('click', () => {
        const checkboxes = document.querySelectorAll('.contact-checkbox');
        const contactItems = document.querySelectorAll('#contactsList li');
        
        if (selectAllBtn.textContent === 'Select All') {
            checkboxes.forEach((checkbox, index) => {
                checkbox.checked = true;
                updateSelection(checkbox, contactItems[index]);
            });
            selectAllBtn.textContent = 'Unselect All';
        } else {
            checkboxes.forEach((checkbox, index) => {
                checkbox.checked = false;
                updateSelection(checkbox, contactItems[index]);
            });
            selectAllBtn.textContent = 'Select All';
        }
        
        updateDeleteBtn();
    });
    
    let deleteBtn;
    const updateSelection = (checkbox, contactItem) => {
        const index = parseInt(checkbox.value, 10);
        if (checkbox.checked) {
            selectedContactIndexes.push(index);
            contactItem.classList.add('selected');
        } else {
            const removeIndex = selectedContactIndexes.indexOf(index);
            if (removeIndex > -1) {
                selectedContactIndexes.splice(removeIndex, 1);
            }
            contactItem.classList.remove('selected');
        }
    };
    // Function to update the Delete button visibility
    const updateDeleteBtn = () => {
        const checkboxes = document.querySelectorAll('.contact-checkbox:checked');
        if (checkboxes.length > 0) {
            if (!deleteBtn) {
                deleteBtn = document.createElement('button');
                deleteBtn.textContent = 'Delete';
                deleteBtn.className = 'address-book-btn';
                deleteBtn.addEventListener('click', () => {
                    // Move this inside the click event to get the most recent checkboxes
                    const currentCheckboxes = document.querySelectorAll('.contact-checkbox:checked');
                    const indexesToDelete = Array.from(currentCheckboxes).map(checkbox => parseInt(checkbox.value, 10));
    
                    // Sort in descending order and then remove
                    indexesToDelete.sort((a, b) => b - a).forEach(index => {
                        const deletedContact = {
                            ...contacts[index],
                            action: 'deleted'
                        };
                        contacts.splice(index, 1);
                        contactsToSync.push(deletedContact);  // Add the deleted contact to contactsToSync
                    });
                    if (contacts.length === 0) {
                        isSelectModeForContacts = false;
                    }
                    syncContacts();  // Sync contacts with client and server
                    renderContacts();
                });
                actionButtonsContainer.appendChild(deleteBtn);
            }
        } else {
            if (deleteBtn) {
                deleteBtn.remove();
                deleteBtn = null;
            }
        }
        
    };
    const attachEventToContactItem = (contactItem, contact, index) => {
        contactItem.addEventListener('click', () => {
            if (isSelectModeForContacts) {
                const checkbox = contactItem.querySelector('.contact-checkbox');
                if (checkbox) {
                    checkbox.checked = !checkbox.checked;
                    updateDeleteBtn();
                }
            } else {
                viewContact(contact);
            }
        });
    
        if (isSelectModeForContacts) {
            const checkbox = document.createElement('input');
            checkbox.type = 'checkbox';
            checkbox.className = 'contact-checkbox';
            checkbox.value = index;
            checkbox.addEventListener('click', (e) => e.stopPropagation());
            checkbox.addEventListener('change', updateDeleteBtn);
            contactItem.prepend(checkbox);
        }
    };

    contactsToRender.forEach((contact, index) => {
        const contactItem = document.createElement('li');
        const contactNameSpan = document.createElement('span');
        contactNameSpan.textContent = contact.name;
        contactItem.appendChild(contactNameSpan);

        attachEventToContactItem(contactItem, contact, startIndex + index);
        contactsList.appendChild(contactItem);
    });

    if (isSelectModeForContacts) {
        contentContainer.appendChild(selectAllBtn);
    }

    searchBar.addEventListener('input', function() {
        const query = searchBar.value.toLowerCase();
        const filteredContacts = contacts.filter(contact => contact.name.toLowerCase().includes(query));
        contactsList.innerHTML = '';
        filteredContacts.forEach((contact, index) => {
            const contactItem = document.createElement('li');
            contactItem.textContent = contact.name;
            attachEventToContactItem(contactItem, contact, index);  // Attach events here too
            contactsList.appendChild(contactItem);
        });
    });

    const createNewBtn = document.createElement('button');
    createNewBtn.textContent = 'Create New Contact';
    createNewBtn.className = 'address-book-btn';
    createNewBtn.addEventListener('click', createNewContact);
        
    // Show the 'Create New Contact' button only if not in select mode
    if (!isSelectModeForContacts) {
        actionButtonsContainer.appendChild(createNewBtn);
    }
    if (isSelectModeForContacts && contacts.length > 0) {
        actionButtonsContainer.appendChild(selectAllBtn);
    }

    

}
function updateBoldButton(currentPage, paginationContainer) {
    // Remove bold class from all pagination buttons inside the given container
    paginationContainer.querySelectorAll('button').forEach(btn => {
        btn.classList.remove('bold');
    });

    // Add bold class to the current page button inside the given container
    const currentPageButton = paginationContainer.querySelector(`button:nth-child(${currentPage + 1})`);  // +1 to account for the left arrow button
    if (currentPageButton) {
        currentPageButton.classList.add('bold');
    }
}
function customPrompt(message, callback) {
    const modal = document.createElement('div');
    modal.className = 'prompt-modal';
    modal.style.zIndex = 1000;  // Just for debugging, ensure it appears on top
    modal.id = 'customInputBoxModal';
    modal.justOpened = true;
    const label = document.createElement('label');
    label.textContent = message;

    const input = document.createElement('input');
    input.type = 'text';
    input.addEventListener('keyup', function(event) {
        if (event.keyCode === 13) { // Enter key
            callback(input.value);
            modal.remove();
        } else if (event.keyCode === 27) { // Esc key
            modal.remove();
        }
    });
    modal.addEventListener('click', () => {
        modal.justOpened = false;  // Reset the flag on any click within the modal
    });
    const submitBtn = document.createElement('button');
    submitBtn.textContent = 'Submit';
    submitBtn.className = 'address-book-btn';
    submitBtn.addEventListener('click', () => {
        callback(input.value);
        modal.remove();
    });

    modal.appendChild(label);
    modal.appendChild(input);
    modal.appendChild(submitBtn);
    document.body.appendChild(modal);
    
    input.focus();
}
function renderFolderSpecificMails(folder) {
    isSelectMode2 = false;
    selectedMailIds = [];
    updateUnreadCount();
    switch (folder) {
        case 'Inbox':
            renderMails('Inbox', null, mail => mail.folder === 'Inbox' && (Array.isArray(mail.to) ? mail.to.includes(viewerPOBox.toString()) : mail.to === viewerPOBox) && mail.from !== viewerPOBox);
            break;
        case 'Sent':
            renderMails('Inbox', viewerPOBox, mail => mail.folder === 'Inbox' && String(mail.from) === String(viewerPOBox),true);
            break;
        case 'Trash':
            renderMails('Trash', null, mail => mail.from !== viewerPOBox && mail.folder === 'Trash');
            break;
        default:
            renderMails(folder, null, mail => mail.folder === folder);
            break;
    }
}
function setActiveBtn(newActiveBtn) {
    if (newActiveBtn == undefined) {
        if (lastActiveBtn) {
            lastActiveBtn.classList.remove('active'); // Remove active class from last active button
        }
    }else {
        if (lastActiveBtn) {
            lastActiveBtn.classList.remove('active'); // Remove active class from last active button
        }
        newActiveBtn.classList.add('active'); // Add active class to the newly clicked button
        lastActiveBtn = newActiveBtn; // Update the last active button

    }
    
}
function renderSendLetterPage() {
    const contentContainer = document.getElementById('contentContainer');
    contentContainer.innerHTML = '';

    // Append elements to contentContainer
    contentContainer.appendChild(createSendToWrapper());
    createContactDropdown(contacts);

    const anonymousWrapper = document.createElement('div');
    anonymousWrapper.className = 'anonymous-wrapper';  // CSS class for padding
    const [anonymousToggle, anonymousLabel] = createAnonymousToggle();
    anonymousWrapper.appendChild(anonymousToggle);
    anonymousWrapper.appendChild(anonymousLabel);
    
    contentContainer.appendChild(anonymousWrapper);
    contentContainer.appendChild(createSubjectInput());  // Added this line for the subject input
    contentContainer.appendChild(createLetterContent());
    contentContainer.appendChild(createSendButton());
}
function decodeHtml(html) {
    var txt = document.createElement("textarea");
    txt.innerHTML = html;
    return txt.value;
}

function buildAndSendLetter() {
    // Remove previous shake classes if any
    document.querySelectorAll('.shake').forEach(el => el.classList.remove('shake'));
    document.querySelectorAll('.red-border').forEach(el => el.classList.remove('red-border'));

    const anon = document.getElementById('anonymousToggle').checked;
    const letterContentEl = document.getElementById('letterContent');
    const subjectInputEl = document.getElementById('subjectInput');
    const toEl = document.getElementById('sendToLabel');

    let allFieldsFilled = true;

    if (selectedContacts.size === 0) {
        toEl.classList.remove('shake', 'red-border');
        triggerReflow(toEl);
        addShakeAndRedBorder(toEl);
        allFieldsFilled = false;
    }
    
    if (!subjectInputEl.value) {
        subjectInputEl.classList.remove('shake', 'red-border');
        triggerReflow(subjectInputEl);
        addShakeAndRedBorder(subjectInputEl);
        allFieldsFilled = false;
    }
    
    if (!letterContentEl.textContent) {
        letterContentEl.classList.remove('shake', 'red-border');
        triggerReflow(letterContentEl);
        addShakeAndRedBorder(letterContentEl);
        allFieldsFilled = false;
    }
    if (!allFieldsFilled) {
        return; // Exit the function if any field is missing
    }

    rawLetterContent  = document.getElementById('letterContent').innerHTML;
    letterContent = decodeHtml(rawLetterContent);
    subjectContent = document.getElementById('subjectInput').value;  // Capture the subject

    // Initialize arrays to hold names and PO Boxes
    const toNamesArray = [];
    const toPOBoxesArray = [];

    // Iterate over each item in the selectedContacts Set
    selectedContacts.forEach(item => {
        if (!isNaN(item)) {
            toPOBoxesArray.push(item);  // If it's a number, add to toPOBoxesArray
        } else {
            const contact = contacts.find(c => c.name === item);
            if (contact) {
                toNamesArray.push(item);  // Add the name to toNamesArray
                toPOBoxesArray.push(contact.poBox);  // Add the PO Box to toPOBoxesArray
            }
        }
    });

    // Construct the new mail object
    const newMail = {
        anon: anon,
        read: false,
        from: viewerPOBox,  // Using the const defined at the top
        to: toPOBoxesArray,  // Using the PO Boxes of selected contacts
        subject: subjectContent,  // Using the captured subject
        body: letterContent,
        folder: 'Inbox',  // Always goes to the receiver's Inbox
        fromName: anon ? 'Anonymous' : myName,  // Using the const defined at the top
        toNames: toNamesArray,  // Names of selected contacts
        date: formatDateUTC(new Date())
    };

    // Add the new mail to the mails array

    // Placeholder for your $.post function
    // Uncomment the line below when you're ready to integrate
    $.post('http://syn_mail/send', JSON.stringify({newmail: newMail}));
    selectedContacts.clear();
    lastActiveBtn.classList.remove('active');
    // Uncheck all the checkboxes in the contacts list
    document.querySelectorAll('.contact-checkbox').forEach((checkbox) => {
        checkbox.checked = false;
    });
    // If you have a mechanism to track which contacts are checked, reset it as well
    for (let key in checkedContacts) {
        checkedContacts[key] = false;
    }
    // Reset the recipient bubble (assuming you have a function for that)
    updateRecipientBubble();
    setActiveBtn()
    clearContentContainer();
}
function triggerReflow(element) {
    void element.offsetWidth;
}
function addShakeAndRedBorder(element) {
    element.classList.add('shake', 'red-border');
    element.addEventListener('animationend', function callback() {
        element.classList.remove('red-border');
        element.removeEventListener('animationend', callback);
    });
}
function syncContacts(disable) {
    if (disable) {disableUI()}
    
    $.post('http://syn_mail/updateContacts', JSON.stringify({ updatedContacts: contactsToSync }));
    contactsToSync = [];
}
function syncMail() {
    $.post('http://syn_mail/updateMail', JSON.stringify({ updatedMail: mailsync }));
    mailsync = [];
}
function syncFolders(disable) {
    if (disable) {disableUI()}
    $.post('http://syn_mail/updateFolders', JSON.stringify({ updatedFolders: foldersToSync }));
    foldersToSync = [];
}

document.getElementById('sendLetterBtn').addEventListener('click', () => {
    renderSendLetterPage();
    setActiveBtn(document.getElementById('sendLetterBtn'));
    isSelectMode = false;
    isSelectMode2 = false;
    selectedMailIds = [];
});

addressBookBtn.addEventListener('click', () => {
    contactsCurrentPage = { value: 1 }
    renderContacts();
    setActiveBtn(addressBookBtn);
    isSelectMode = false;
    isSelectMode2 = false;
    selectedMailIds = [];
});

foldersBtn.addEventListener('click', () => {
    renderFolders();
    setActiveBtn(foldersBtn);
    isSelectMode = false;
    isSelectMode2 = false;
    selectedMailIds = [];
});

inboxBtn.addEventListener('click', () => {
    renderMails('Inbox', null, mail => mail.folder === 'Inbox' && (Array.isArray(mail.to) ? mail.to.includes(viewerPOBox.toString()) : mail.to === viewerPOBox) && mail.from !== viewerPOBox);
    setActiveBtn(inboxBtn);
    isSelectMode = false;
    isSelectMode2 = false;
    selectedMailIds = [];
});  

