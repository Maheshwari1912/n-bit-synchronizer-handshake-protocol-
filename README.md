# n-bit-synchronizer-handshake-protocol
**How the Handshake Protocol Works:**

The handshake protocol is a synchronization mechanism often used in digital systems, especially when transferring data between different clock domains.

It ensures that data is transferred reliably from a sender (source) to a receiver (destination) without any loss, corruption, or timing errors, especially when the clocks in both domains are asynchronous or have different frequencies. 

**Basic Concept:** 

• The sender asserts a signal (req or request) to indicate that it has valid data to send. 

• The receiver responds by asserting an acknowledgment signal (ack) once it has received 
the data. 

• The sender deasserts its request (req) after it detects the acknowledgment (ack), ensuring 
that the receiver has processed the data. 

• The receiver also deasserts ack once the handshake cycle is complete, preparing for the 
next data transfer. 

This protocol guarantees that data is correctly synchronized across clock domains before the next data transaction begins. 

**Working of the Handshake Protocol:**

**1. Initial State:**

o The sender and receiver are both idle. The req and ack signals are both deasserted (0). 

**2. Sender Asserts req (Request):**

o When the sender has valid data ready to send, it asserts the req signal. This tells 
the receiver that there is data available for transfer. 

o The sender holds the req signal high (1) until the receiver acknowledges that it has 
received the data. 

**3. Receiver Detects req and Asserts ack (Acknowledge):**

o The receiver, operating in its own clock domain, continuously monitors the req 
signal. 

o Once the receiver detects the req signal (indicating valid data from the sender), it 
latches the data and asserts the ack signal. 

o The ack signal indicates to the sender that the data has been successfully received. 

**4. Sender Detects ack and Deasserts req:**

o When the sender detects the ack signal, it knows that the receiver has received the 
data. The sender can now deassert the req signal, indicating that the current data 
transfer cycle is complete. 

o After deasserting req, the sender prepares for the next data transaction. 

**5. Receiver Deasserts ack:**

o Once the receiver detects that the req signal has been deasserted, it deasserts the 
ack signal. This prepares the receiver to handle the next data transfer. 

**6. Cycle Repeats:**

o The handshake cycle repeats for each new piece of data. The sender asserts req, 
the receiver acknowledges with ack, and the process continues, ensuring reliable 
data transfer between the two clock domains. 

**simulation results:**

![image](https://github.com/user-attachments/assets/b9dbdc59-d1f0-4130-ad6c-787c25406bbe)

**schematic:**

![image](https://github.com/user-attachments/assets/643754f1-09b4-460a-8625-85b9208489f6)
